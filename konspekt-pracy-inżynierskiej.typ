#import "synopsis-template.typ": apply-synopsis-template

// !!! change this !!!
#let language = "pl"
#let title = "Proposed Title of the Thesis / Proponowany tytuł pracy dyplomowej."
#let authors = ("Filip Kwiatkowski, s17137",)
// !!! change this !!!

#let terms = yaml("terms.yaml").at(language)
#let accent-color = rgb("#be161e")
#let to-fill = text(fill: accent-color, smallcaps(lower(terms.to-fill)))

#show: apply-synopsis-template.with(
    language: language,
    authors: authors,
    title: title,
)

= #terms.formal-info

+ #terms.studies:

  #to-fill

+ #terms.supervisor:

  #to-fill

+ #terms.accept-date:

  #to-fill

= #terms.rationale

+ #terms.motivation:

  #to-fill

  (Omówienie powinno precyzować działy baz danych,
  inżynierii oprogramowania, internetu
  czy systemów rozproszonych,
  których praca ma dotyczyć.
  Warto też wspomnieć o systemach,
  udogodnieniach, językach i standardach,
  które będą przedmiotem tej pracy.
  Należy również uzasadnić podjęcie tego tematu.)

  #divider()

  (The description should specify
  the areas of databases, software engineering, the internet,
  or distributed systems
  that the thesis will concern.
  It should also identify
  the systems, tools, programming languages, and standards
  that will be covered.
  It should also explain the rationale
  for choosing this topic.)

+ #terms.relationship:

  #to-fill

  (Czy praca stanowi kontynuację innej pracy dyplomowej,
  czy wynika z tematu, z którym dyplomant ma do czynienia
  w pracy zawodowej,
  czy wynika z pewnych szczególnych doświadczeń lub zainteresowań,
  czy też wynika z wyczucia perspektyw zawodowych itp.
  Omówienie powinno jasno określać
  stopień znajomości tematyki i problematyki
  związanej z proponowanym tematem przez dyplomanta.)

  #divider()

  (Whether the thesis builds on previous academic work,
  relates to a topic encountered in the student's professional experience,
  stems from specific interests or personal experience,
  or reflects anticipated career opportunities.
  The description should clearly indicate
  the student's level of familiarity
  with the subject
  and the issues related to the proposed topic.)

+ #terms.soa:

  #to-fill

  (Omówienie istniejących rozwiązań z danego obszaru.
  Odpowiedzenie na pytanie,
  w czym proponowane rozwiązanie będzie lepsze
  lub chociaż inne.
  Te różnice mogą być związane np. z:
  - wydajnością,
  - bezpieczeństwem,
  - funkcjonalnościami,
  - sposobem obsługi,
  - rozwiązaniami technicznymi,
  - zastosowanymi technologiami itp.

  Należy również omówić cel i zakres pracy:
  - Jaką potrzebę praca zrealizuje?
  - Jaką wadę może wyeliminować?
  - Jaką nową jakość może wnieść?
  - Kto skorzysta na tej pracy?
  - Jakie procesy zostaną usprawnione?)

  #divider()

  (Review existing solutions
  in the relevant field
  and explain how the proposed solution
  will improve upon them
  or otherwise differ.
  These differences may relate to:
  - Performance
  - Security
  - Functionality
  - Usability
  - Technical approach
  - Technologies used

  Also describe the aim and scope of the thesis:
  - What need it will address?
  - What shortcomings it may eliminate?
  - What added value it will provide?
  - Who will benefit from it?
  - What processes it will improve?)

= #terms.basics

= #terms.schedule

= #terms.risks-resources
