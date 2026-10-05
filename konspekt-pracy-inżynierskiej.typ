#set page(
    paper: "a4",
    footer: context [
        #set text(fill: gray)

        #show regex("\d+"): it => strong(it)

        #grid(columns: (1fr, 1fr, 1fr),
            [Konspekt pracy inżynierskiej]
            ,align(center)[strona #counter(page).display("1 z 1", both: true)],
            h(100%)
        )
    ]
)

#show link: it => text(fill: blue)[*#it*]

#strong[Polsko-Japońska Akademia Technik Komputerowych]\
Katedra: #strong[Inżynieria Oprogramowania i Baz Danych]\

#align(center)[
    #text(size: 2em, strong[Konspekt pracy inżynierskiej])
]

#block(fill: rgb("#FFF2CC"), inset: 10pt)[
    #show text: it => emph(it)
    #grid(columns: 2,
        block[#v(-0.35em) #text(size: 3em)[#emoji.book.open]],
        [
            *Przed* wypełnieniem poniższego dokumentu należy *uważnie* przeczytać uwagi odnośnie:
            - pracy inżynierskiej: #link("https://www.mtrzaska.com/praca-dyplomowa-pro/")#footnote[W szczególności proszę zwrócić uwagę na nawiązanie do *uwag ogólnych dotyczących pracy magisterskiej*, które również się tutaj aplikują.].
            - pracy magisterskiej: #link("http://www.mtrzaska.com/seminarium-magisterskie-informacje").
        ]
    )
]

#let fullWidth = table.cell.with(colspan: 4)

// ========== TODO: Należy wypełnić bloki zawierające tyldy (~) odpowiednimi informacjami. ==========

#table(
    columns: (1fr, 1fr, 1fr, 1fr),
    stroke: 1pt,
    inset: 5pt,
    fill: (x, y) => if calc.even(y) { luma(230) },
    table.cell(colspan: 3)[1. Imię i nazwisko dyplomanta / dyplomantki.], [2. Nr albumu.],
    table.cell(colspan: 3)[~], [~],
    fullWidth[3. Studia, specjalizacja, kod grupy projektowej, np. "Informatyka niestacjonarne drugiego stopnia polskojęzyczne Warszawa; Programowanie Aplikacji Biznesowych; PRO1G".],
    fullWidth[~],
    fullWidth[4. Tytuł, imię i nazwisko prowadzącego (promotora).],
    fullWidth[~],
    table.cell(colspan: 2)[5. Data przekazania konspektu.], table.cell(colspan: 2)[6. Data zatwierdzenia tematu pracy i konspektu.],
    table.cell(colspan: 2)[~], table.cell(colspan: 2)[~],
    fullWidth[7. Proponowany tytuł pracy (uzgodniony z osobą prowadzącą).],
    fullWidth[~],
    fullWidth[8. Krótkie omówienie motywacji i kontekstu pracy. Omówienie powinno precyzować dział/działy baz danych, inżynierii oprogramowania, Internetu lub systemów rozproszonych, której praca ma dotyczyć, systemy, udogodnienia, języki, standardy, które będą przedmiotem tej pracy, oraz motywację podjęcia tego tematu.],
    fullWidth[~],
    fullWidth[9. Krótkie omówienie związków proponowanego tematu z dotychczasowym życiorysem zawodowym dyplomanta: czy praca stanowi kontynuację innej pracy dyplomowej, czy wynika z tematu, z którym dyplomant ma do czynienia w pracy zawodowej, czy wynika z pewnych szczególnych doświadczeń lub zainteresowań, czy też wynika z wyczucia perspektyw zawodowych itp. Omówienie powinno jasno określać stopień znajomości tematyki i problematyki związanej z proponowanym tematem przez dyplomanta.],
    fullWidth[~],
    fullWidth[10. Stan sztuki --- omówienie istniejących rozwiązań z danego obszaru i w czym proponowane rozwiązanie będzie lepsze lub chociaż inne? Te różnice mogą być związane z np. wydajnością, bezpieczeństwem, funkcjonalnościami, sposobem obsługi, rozwiązaniami technicznymi, zastosowanymi technologiami itp. Należy również omówić cel i zakres pracy: jaką potrzebę praca zrealizuje, jaką wadę może wyeliminować, jaką nową jakość może wnieść, kto skorzysta na tej pracy, jakie procesy zostaną usprawnione itd.],
    fullWidth[~],
    fullWidth[11. Źródła informacyjne i materiały niezbędne do napisania pracy: książki, czasopisma, dokumentacja, strony Web, materiały niepublikowane. Trudności z pozyskaniem, zgromadzeniem, dostępem, kompletnością, objętością do przeczytania, specjalistyczną hermetycznością itd. Czy występują u dyplomanta trudności z językiem angielskim materiałów?],
    fullWidth[~],
    fullWidth[12. Podstawy teoretyczne, metodologie, standardy, na których praca będzie się opierać lub których ma dotyczyć.],
    fullWidth[~],
    fullWidth[13. Działające systemy, kompilatory, biblioteki, udogodnienia itp., których praca ma dotyczyć. Ten punkt ma zastosowanie gdy np. modyfikujemy jakieś istniejące rozwiązania.],
    fullWidth[~],
    fullWidth[14. Proponowane środki implementacyjne i narzędziowe: systemy zarządzania bazami danych, metodyki i notacje w inżynierii oprogramowania, języki programowania, systemy dedykowane dla Internetu itd.],
    fullWidth[~],
    fullWidth[15. Krótkie omówienie tych środków z następujących punktów widzenia: ich znajomości przez dyplomanta, ich nowoczesności, popularności, dostępności, uniwersalności, celowości, przydatności itd.],
    fullWidth[~],
    fullWidth[16. Omówienie ewentualnych pracochłonnych badań empirycznych, eksperymentów, badań rynkowych, testów, porównań, zestawień, testów zaimplementowanego oprogramowania niezbędnych dla zrealizowania tematu pracy.],
    fullWidth[~],
    fullWidth[17. Merytoryczny plan pracy (zadania do wykonania), proponowany spis treści oraz wstępna ocena objętości poszczególnych rozdziałów w stronach. Warto zapoznać się z #link("https://www.mtrzaska.com/seminarium-magisterskie-informacje/")[informacjami z pkt. 4].],
    fullWidth[~],
    fullWidth[18. Realistyczny harmonogram pracy (wykorzystujący daty wyrażone jako rok i miesiąc) z wyraźnym określeniem terminów poszczególnych faz: uczenia się, tworzenia koncepcji, tworzenia oprogramowania, opisu motywacji i stanu sztuki, opisu teoretycznego, opisu zastosowanej metody, opisu implementacji itd.; zasadnicze pisanie tekstu odbywa się dopiero po zatwierdzeniu prototypu; obrony prac przeprowadzane są tylko w sesjach egzaminacyjnych.],
    fullWidth[~],
    fullWidth[19. Krótkie omówienie potencjalnych zastosowań wyników pracy oraz stopnia jej generyczności/uniwersalności (np. system wtyczek). Należy podać w jakich obszarach zastosowań mogą być potencjalnie zastosowane te wyniki, jak szeroki jest to obszar i jakie dalsze akcje (po zakończeniu pracy) należałoby podjąć celem rozwinięcia lub upowszechnienia wyników pracy.],
    fullWidth[~],
    fullWidth[20. Krótkie omówienie nowatorskiego lub wynalazczego charakteru pracy (o ile występuje); podanie powodów, dla których realizacja celu pracy może być nową jakością w informatyce.],
    fullWidth[~],
    fullWidth[21. Analiza ryzyka związanego z pracą: określenie elementów koncepcji, narzędzi, teorii, literatury, dokumentacji, które mogą stanowić trudność przy realizacji pracy, realistyczna ocena własnych kompetencji i wiedzy, realistyczna ocena ewentualnej pomocy osób zewnętrznych (w tym osoby prowadzącej), realistyczna ocena dostępności oprogramowania narzędziowego, kodów źródłowych, dokumentacji, ocena możliwości w zakresie zaplecza komputerowego PJATK, ocena możliwości własnego zaplecza poza PJATK itd.],
    fullWidth[~],
    fullWidth[22. Określenie wymagań co do zaplecza komputerowego (sprzęt, oprogramowanie, infrastruktura, lokal, pomoc techniczna) w PJATK, które jest niezbędne do realizacji pracy.],
    fullWidth[~],
    fullWidth[23. Nośnik, na którym będzie udostępnione oprogramowanie: np. CD-ROM, strona Web lub inne.],
    fullWidth[~],
    fullWidth[24. Podział części pracy pomiędzy jej realizatorów: podział tematów, podział implementacji, podział części tekstu pracy. Podziały powinny przedstawiać procentowy udział poszczególnych wykonawców w poszczególnych częściach pracy.],
    fullWidth[~],
)

#emph[Opracował: Kazimierz Subieta, Mariusz Trzaska, wersja z dnia 2025-10-27]\
#emph[Źródło i więcej informacji: #link("http://www.mtrzaska.com/seminarium-magisterskie-informacje"), #link("https://www.mtrzaska.com/praca-dyplomowa-pro/")]\
#emph[Port z dokumentu `.docx` na Typst: Filip Kwiatkowski, wersja z dnia 2025-10-27]