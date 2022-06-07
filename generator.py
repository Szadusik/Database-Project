import random
class Generator:
    def __init__(self):
        self.labels = None
        self.values = []
    
    def generate_data(self,data : list[dict], labels=None):
        if labels is None:
            labels = tuple(data[0].keys())

        self.labels = labels
        for row in data:
            val = [f'{row[key]}' for key in self.labels]
            self.values.append(tuple(val))

    def save_data(self,filename: str, table: str):
        f = open(filename,"w")
        f.write(f"INSERT INTO `{table}` {self.labels} VALUES ")
        for el in self.values:
            f.write(f"{tuple(el)}, ")
        
        f.close()

    @staticmethod
    def check_number(number: int) -> str:
        return str(number) if number >=10 else '0' + str(number)

    @staticmethod
    def generate_pesel() -> tuple:
        year = random.randint(1900,2010)
        month = random.randint(1,12)
        year_before = year
        month_before = month

        if year >= 2000:
            month+=20

        odd_months = (1, 3, 5, 7, 8, 10, 12, 21, 23, 25, 27, 28, 30, 32)
        even_months = (4, 6, 9, 11, 24, 26, 29, 31)
        
        if month in odd_months:
            day = random.randint(1,31)
        elif month in even_months:
            day = random.randint(1,30)      
        else:
            day = random.randint(1,29) if (year % 4 == 0 and year != 1900) else random.randint(1,28)

        four_random = random.randint(1000,9999)

        year = Generator.check_number(year%100)
        month = Generator.check_number(month)
        day = Generator.check_number(day)

        pesel = str(year) + str(month) + str(day) + str(four_random)
        factors = [1,3,7,9,1,3,7,9,1,3]
        last = 0
        for i in range(len(factors)):
            last+=int(pesel[i])*factors[i]

        last%=10
        pesel += ('0' if last == 0 else str(10 - last))
        return f'{year_before}-{month_before}-{day}', pesel


    @staticmethod
    def generate_person_data() -> dict:
        names = ['Aneta','Adam','Ewelina','Ewa','Sylwia','Filip','Marek','Robert','Mateusz','Aleksander','Krzysztof','Marcin',
                'Sebastian','Tymoteusz','Szymon','Maciek','Zofia','Paulina','Bartosz','Wojciech','Daniel','Magdalena','Katarzyna',
                'Anna','Julian']
        surnames = ['Nowak','Kowal','Radowicz','Parowin','Rakowicz','Krzywiasta','Dagmarowicz','Socha','Landmar','Lakon','Shmidt',
                'Eldoran','Mintowicz','Dostojewski','Konstyn','Kartezjan','Weldman','Hajzer','Gessler','Strasburger','Shwartz',
                'Kononowicz','Zwierzynski','Majkut']
        states = ['Zonat(y)/(a)','Nieustalony','Wdowa/Wdowiec','Rozwiedzion(y)/(a)','Separacja','Kawaler/Panna','Woln(y)/(a)']
        PESEL = Generator.generate_pesel()

        return {
            'PESEL' : PESEL[1],
            'imie' : random.choice(names),
            'nazwisko' : random.choice(surnames),
            'data_urodzenia' : PESEL[0],
            'dodatkowe_informacje' : "Brak informacji",
            'stan_cywilny' : random.choice(states),
            'zatrudniony' : random.randint(0,1),
            'numer_telefonu' : '+48' + ''.join([str(random.randint(0,9)) for i in range(9)])
        }
            
    @staticmethod
    def generate_building(ID : int) -> dict:
        return {
            'ID_Budynku' : ID,
            'numer' : random.randint(1,50),
            'ulica' : random.choice(['Bielska','Mickiewicza','Fabryczna','Piastowska','Rzeczna','Sosnowskiego','Degaulla',
            'Tokarskiego','3-go Maja','Pawia','Przymierza','Opolska','Katowicka','Reymonta','Witosa','Ozimska','Koryncka']),
            'dzielnica': random.choice(['Bronowice','Malinka','Huta','Nadrzecze','Metalhem','Wilda','Elektryk','Krowodrza']),
            'kod_pocztowy' : '30-'+ str(random.randint(100,900))
        }
        
    @staticmethod
    def generate_flat(buildings_amount: int, ID : int):
        return {
            'ID_lokalu' : ID,
            'ID_Budynku' : random.randint(1,buildings_amount),
            'powierzchnia' : random.randint(20,100),
            'typ_lokalu' : random.choice(['Apartamentowiec','Mieszkanie','Dom rodzinny','Kawalerka','Gospodarstwo']),
            'numer_lokalu' : random.randint(1,20),
            'wlasciciel': random.choice(['Osoba prywatna', 'Deweloper', 'Spoldzielnia', 'Urzad miasta', 'Firma'])
        }


if __name__ == "__main__":
    gen = Generator()
    people = [Generator.generate_person_data() for i in range(50)]
    gen.generate_data(people,labels=('PESEL','imie','nazwisko','data_urodzenia','dodatkowe_informacje'))
    gen.save_data("data/people.txt",'osoba')

    details = people[:30]
    gen.generate_data(details,labels=('PESEL','stan_cywilny','zatrudniony','numer_telefonu'))
    gen.save_data("data/details.txt",'mieszkaniec')

    buildings = [Generator.generate_building(i) for i in range(30)]
    gen.generate_data(buildings)
    gen.save_data("data/buldings.txt",'budynek')

    apartaments = [Generator.generate_flat(30,i) for i in range(70)]
    gen.generate_data(apartaments)
    gen.save_data("data/apartaments.txt",'lokal')
