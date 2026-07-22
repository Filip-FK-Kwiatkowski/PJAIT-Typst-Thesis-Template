#import "@preview/icu-datetime:0.2.0" as icu

#let commonPhrases = (
    "logo": ("pl": "contents/assets/images/PJATK_pl_poziom_1.pdf", "en": "contents/assets/images/PJAIT_en_poziom_1.pdf"),
    "supervision-text": (
        "engineering": ("pl": "Praca inżynierska napisana pod kierunkiem:", "en": "Bachelor's degree thesis written under the supervision of:"),
        "master": ("pl": "Praca magisterska napisana pod kierunkiem:", "en": "Master's degree thesis written under the supervision of:"),
    ),
    "city": ("pl": "Warszawa", "en": "Warsaw"),
    "abstract": ("pl": "Streszczenie", "en": "Abstract"),
    "keywords": ("pl": "Słowa kluczowe", "en": "Keywords"),
    "toc-title": ("pl": "Spis Treści", "en": "Table of Contents"),
    "list-of-listings": ("pl": "Spis Listingów", "en": "List of Listings"),
    "list-of-figures": ("pl": "Spis Rysunków", "en": "List of Figures"),
    "list-of-tables": ("pl": "Spis Tabel", "en": "List of Tables"),
    "bibliogrpahy": ("pl": "Bibliografia", "en": "Bibliogrpahy"),
)

#let aiStatementStrings = (
    "pl": (
        "title": "OŚWIADCZENIE STUDENTA DOTYCZĄCE WYKORZYSTANIA SZTUCZNEJ INTELIGENCJI (AI)",
        "name-prefix": "Ja, niżej podpisany/a:",
        "field-prefix": "student/ka kierunku:",
        "album-prefix": "numer albumu studenta:",
        "paragraphs": (
            "Oświadczam, że zapoznałem/am się z treścią Zarządzenia Rektora Polsko-Japońskiej Akademii Technik Komputerowych z dnia 1 kwietnia 2026 r. oraz z \"Wytycznymi dotyczącymi wykorzystywania sztucznej inteligencji w procesie dydaktycznym PJATK\", stanowiącymi załącznik do ww. zarządzenia.",
            "Oświadczam, że ewentualne wykorzystanie narzędzi sztucznej inteligencji (AI) w niniejszej pracy miało charakter wyłącznie pomocniczy i nie stanowiło zastępstwa dla mojej samodzielnej pracy.",
            "Oświadczam, że treść pracy stanowi moje własne, samodzielne opracowanie oraz ponoszę pełną odpowiedzialność za jej zawartość, niezależnie od wykorzystania narzędzi AI.",
            "Oświadczam, że nie wykorzystywałem/am narzędzi AI do generowania treści stanowiących zasadniczą część pracy, w szczególności analiz, wniosków, interpretacji ani części podlegających ocenie jako przejaw twórczości własnej.",
            "W przypadku korzystania z narzędzi AI sporządziłem/am Raport użycia AI zgodnie z obowiązującymi Wytycznymi i dołączyłem/am go do pracy.",
        ),
        "signature-label": "(czytelny podpis studenta/studentki)",
    ),
    "en": (
        "title": "STUDENT'S STATEMENT REGARDING THE USE OF ARTIFICIAL INTELLIGENCE (AI)",
        "name-prefix": "I, undersigned:",
        "field-prefix": "Student:",
        "album-prefix": "Student's album number:",
        "paragraphs": (
            "I hereby declare that I have read the content of the Order of the Rector of the Polish-Japanese Academy of Information Technology of 1 April 2026 and the \"Guidelines on the use of artificial intelligence in the teaching process of PJATK\", which are attached to the above-mentioned order.",
            "I declare that the possible use of artificial intelligence (AI) tools in this work was only auxiliary and did not constitute a substitute for my independent work.",
            "I declare that the content of the work is my own research and I am fully responsible for its content, regardless of the use of AI tools.",
            "I declare that I have not used AI tools to generate content that constitutes an essential part of the work, in particular analyses, conclusions, interpretations or parts that are subject to evaluation as a manifestation of my own work.",
            "In the case of using AI tools, I have prepared an AI Usage Report in accordance with the applicable Guidelines and attached it to the work.",
        ),
        "signature-label": "(legible signature of the student)",
    ),
)

#let placeholder-abstract = [
    The abstract should be between 400 and 1500 characters, including spaces.
    *Thesis written in English must also include abstract and keywords translation to Polish*.
    Abstract should usually be written *towards the end* of your thesis work, since that is the time when you best know what (and how) exactly has been accomplished.
    *Pay extra attention and spend some extra time when developing an abstract.*
    This is due to the fact that most people will be glancing over your abstract in order to determine whether it is worth it for them to delve deeper into your work.
    This is the place where you need to attractively explain what can be found in this thesis.
    Do not introduce additional paragraphs in the abstract.
    The rest of this document describes general rules for writing theses documentations in PJAIT.]

#let placeholder-keywords = [
    Keywords #sym.dot.op can #sym.dot.op be #sym.dot.op both #sym.dot.op single- or multiple-word phrases
    #sym.dot.op At #sym.dot.op least #sym.dot.op 3 #sym.dot.op keywords #sym.dot.op are #sym.dot.op necessary
    #sym.dot.op Treat #sym.dot.op them #sym.dot.op as #sym.dot.op tags #sym.dot.op Your #sym.dot.op thesis
    #sym.dot.op must #sym.dot.op be #sym.dot.op searchable #sym.dot.op using #sym.dot.op them #sym.dot.op
    Separate them by using the `#sym.dot.op` syntax.]

#let mk(t) = eval(mode: "markup", t)

#let titlepage(
    language,
    thesis-type,
    margin,
    faculty,
    department,
    specialization,
    authors,
    title,
    supervisor,
    reviewer,
) = {
       set page(margin: margin)
       image(commonPhrases.at("logo").at(language))

       align(center)[
           #v(2cm)

           #strong(faculty)

           #v(1cm)

           #strong(department)\
           #specialization

           #v(1cm)

           #mk(authors.map(s => s.replace("#", "\#") + "\\").join("\n"))

           #v(1cm)

           #{
               set par(justify: false)
               strong(text(size: 2em, hyphenate: false, title))
           }

           #v(1fr)

           #align(right)[
               #set par(leading: 0.5em, justify: false)
               #set text(hyphenate: false)
               #block(width: 5cm)[
                   #align(left)[
                       #commonPhrases.at("supervision-text").at(thesis-type).at(language)
                       #v(1em)
                       #strong(supervisor)\
                       #reviewer
                   ]
               ]
           ]

           #v(1fr)

           #commonPhrases.at("city").at(language),
           #icu.fmt(datetime.today(), date-fields: "YM", locale: language, length: "long")
       ]
    }

#let abstractAndKeywords(language, abstract, keywords) = {
    align(center, strong(text(size: 1.5em, [#commonPhrases.at("abstract").at(language)])))

    abstract

    v(1em)
    align(center, strong(text(size: 1.5em, [#commonPhrases.at("keywords").at(language)])))

    keywords
}

#let aiStatement(language, name, album, field, placeDate) = {
    let s = aiStatementStrings.at(language)

    align(right)[
        #set par(justify: false)
        #placeDate
    ]

    v(2.2cm)

    align(center)[
        #set par(justify: false)
        #strong(text(size: 1.1em, hyphenate: false)[#mk(s.at("title"))])
    ]

    v(1.6cm)

    let fieldLine(prefix, value) = block(below: 0.55em)[
        #mk(prefix) #mk(value.replace("#", "\#"))
    ]

    {
        set par(justify: false)
        fieldLine(s.at("name-prefix"), name)
        fieldLine(s.at("field-prefix"), field)
        fieldLine(s.at("album-prefix"), album)
    }

    v(1em)

    for p in s.at("paragraphs") {
        par(p)
    }

    v(1.8cm)
    align(right)[
        #set par(justify: false)
        #box(width: 6.5cm, repeat(gap: 2pt)[.]) \
        #mk(s.at("signature-label"))
    ]
}

#let apply-pjatk-template(
    body,
    language: "en",
    thesis-type: "engineering",
    faculty: "Faculty of Computer Science",
    department: "Name of your Specialization's Department",
    specialization: "Name of your Specialization",
    field-of-study: "Computer Science",
    authors: ("Your Name --- s#####",),
    title: "Your Carefully Selected and Expressive Thesis Title",
    supervisor: "Supervisor's Name",
    supervisor-pl: "Imię i nazwisko promotora",
    reviewer: "Reviewer's Name",
    reviewer-pl: "Imię i nazwisko recenzenta",
    abstract: placeholder-abstract,
    keywords: placeholder-keywords,
    for-printing: false,
    faculty-pl: "Wydział Informatyki",
    department-pl: "Nazwa katedry",
    specialization-pl: "Nazwa specjalizacji",
    field-of-study-pl: "Informatyka",
    title-pl: "Twój starannie dobrany i ekspresywny tytuł pracy dyplomowej",
    abstract-pl: "Tłumaczenie streszczenia.",
    keywords-pl: "Tłumaczenie słów kluczowych.",
    highlight-inline-code: true,
) = {
    assert(
        thesis-type in ("engineering", "master"),
        message: "thesis-type must be either \"engineering\" or \"master\", got: " + repr(thesis-type),
    )

    set document(title: title)

    let normalMargins = (top: 1in, bottom: 1.25in, left: 1.75in, right: 1.75in);
    let printingMargins = (top: 1in, bottom: 1.25in, inside: 2.25in, outside: 1.25in);

    let chosenMargins = if for-printing {
        printingMargins
    } else {
        normalMargins
    }

    set page(
        paper: "a4",
        margin: chosenMargins,
        numbering: none
    )

    set text(
        size: 10pt,
        font: "EB Garamond",
        lang: language
    )

    set par(justify: true)

    set heading(numbering: "1.1")

    show ref: it => {
        if it.element != none and it.element.func() == heading {
            return link(
                it.element.location(),
                context {
                    show text: it => strong(it)
                    numbering(
                        it.element.numbering,
                        ..counter(heading).at(it.element.location()),
                    )
                    [ ]
                    it.element.body
                },
            )
        }
        it
    }

    show raw.where(block: false): it => {
        if highlight-inline-code {
            highlight(
                radius: 2pt,
                fill: rgb(210, 235, 235, 80),
                extent: 0.5pt,
                top-edge: 1em,
                bottom-edge: -0.25em
            )[#it]
        } else {
            it
        }
    }

    show raw.where(block: true): set text(size: 0.8em)

    set enum(indent: 1em)
    set list(indent: 1em, marker: ([•], [◦]))
    set quote(block: true)

    show heading: set text(hyphenate: false)
    show heading.where(level: 1): it => { pagebreak(weak: true, to: "odd"); it }

    show figure.where(kind: raw): set figure.caption(position: top)
    show figure.where(kind: raw): set block(breakable: true)
    show figure.where(kind: table): set figure.caption(position: top)
    show figure.where(kind: table): set block(breakable: true)
    show figure.where(kind: table): set par(justify: false)
    show figure.caption: set block(sticky: true)

    set math.equation(numbering: "(1)")

    context {
        [
            #titlepage(
                language,
                thesis-type,
                normalMargins,
                faculty,
                department,
                specialization,
                authors,
                title,
                if text.lang == "pl" { supervisor-pl } else { supervisor },
                if text.lang == "pl" { reviewer-pl } else { reviewer },
            )
        ]

        if text.lang == "en" {
            set text(lang: "pl")
            [
                #titlepage(
                    "pl",
                    thesis-type,
                    normalMargins,
                    faculty-pl,
                    department-pl,
                    specialization-pl,
                    authors,
                    title-pl,
                    supervisor-pl,
                    reviewer-pl,
                )
            ]
            set text(lang: "en")
        } else {
            [~]
            pagebreak()
        }
    }

    set page(numbering: "1")

    import "@preview/codly:1.3.0": *
    import "@preview/codly-languages:0.1.1": *
    show: codly-init.with()

    codly(
        zebra-fill: none,
        breakable: true,
        number-align: right,
        number-placement: "outside",
        number-format: (n) => text(luma(180))[#str(n)],
        stroke: none,
        inset: (top: 0.25em, bottom: 0.25em),
        display-icon: false,
        display-name: false
    )

    context {
        abstractAndKeywords(language, abstract, keywords)

        if text.lang == "en" {
            pagebreak()
            set text(lang: "pl")
            abstractAndKeywords("pl", abstract-pl, keywords-pl)
            set text(lang: "en")
        }
    }

    context {
        let stmtLang = text.lang
        let fieldValue = if stmtLang == "pl" { field-of-study-pl } else { field-of-study }
        let dateLocale = if stmtLang == "pl" { "pl" } else { "en-GB" }
        let placeDate = [#commonPhrases.at("city").at(stmtLang), #icu.fmt(datetime.today(), date-fields: "YMD", locale: dateLocale, length: "long")#if stmtLang == "pl" [ r.]]

        pagebreak()
        pagebreak()
        for (i, author) in authors.enumerate() {
            if i > 0 { pagebreak() }
            let parts = author.split("---")
            let name = parts.at(0).trim()
            let album = if parts.len() > 1 { parts.at(1).trim() } else { "" }
            aiStatement(stmtLang, name, album, fieldValue, placeDate)
        }
    }

    align(
        center,
        context {
            show outline.entry.where(level: 1): it => link(
                it.element.location(),
                it.indented(
                    strong(it.prefix()),
                    [#smallcaps(strong(it.body())) #show text: it => strong(it); #box(width: 1fr, repeat(it.fill, gap: 0.15em)) #it.page()]
                ),
            )

            show outline.entry.where(level: 3): it => emph(it)

            outline(title: commonPhrases.at("toc-title").at(text.lang), target: heading)
        }
    )

    body

    context {
        bibliography(
            title: commonPhrases.at("bibliogrpahy").at(text.lang),
            "references.bib",
        )
    }

    context {
        show outline: set heading(outlined: true)
        outline(title: commonPhrases.at("list-of-listings").at(text.lang), target: figure.where(kind: raw))
        outline(title: commonPhrases.at("list-of-figures").at(text.lang), target: figure.where(kind: image))
        outline(title: commonPhrases.at("list-of-tables").at(text.lang), target: figure.where(kind: table))
    }
}
