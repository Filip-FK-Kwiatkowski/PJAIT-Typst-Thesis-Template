#import "@preview/icu-datetime:0.2.0" as icu

#let commonPhrases = (
    "logo": ("pl": "PJATK_pl_poziom_1.pdf", "en": "PJAIT_en_poziom_1.pdf"),
    "supervision-text": ("pl": "Praca inżynierska / Praca magisterska napisana pod kierunkiem:", "en": "Master's degree / Bachelor's degree thesis written under the supervision of:"),
    "city": ("pl": "Warszawa", "en": "Warsaw"),
    "abstract": ("pl": "Streszczenie", "en": "Abstract"),
    "keywords": ("pl": "Słowa kluczowe", "en": "Keywords"),
    "toc-title": ("pl": "Spis Treści", "en": "Table of Contents"),
    "list-of-listings": ("pl": "Spis Listingów", "en": "List of Listings"),
    "list-of-images": ("pl": "Spis Rysunków", "en": "List of Images"),
    "list-of-tables": ("pl": "Spis Tabel", "en": "List of Tables"),
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
    #sym.dot.op Threat #sym.dot.op them #sym.dot.op as #sym.dot.op tags #sym.dot.op Your #sym.dot.op thesis
    #sym.dot.op must #sym.dot.op be #sym.dot.op searchable #sym.dot.op using #sym.dot.op them #sym.dot.op
    Separate them by using the `#sym.dot.op` syntax.]

#let titlepage(
    language,
    margin,
    faculty,
    department,
    specialization,
    authors,
    title,
    supervisor,
    auxiliary-supervisor,
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

           #eval(mode: "markup", authors.map(s => s.replace("#", "\#") + "\\").join("\n"))

           #v(1cm)

           #{
               set par(justify: false)
               strong(text(size: 2em, hyphenate: false, title))
           }

           #v(1fr)

           #align(right)[
               #set par(leading: 0.5em)
               #block(width: 5cm)[
                   #align(left)[
                       #commonPhrases.at("supervision-text").at(language)
                       #v(1em)
                       #strong(supervisor)\
                       #auxiliary-supervisor
                   ]
               ]
           ]

           #v(1fr)

           #commonPhrases.at("city").at(language),
           #icu.fmt(datetime.today(), locale: language, length: "long")
       ]
    }

#let abstractAndKeywords(language, abstract, keywords) = {
    align(center, strong(text(size: 1.5em, [#commonPhrases.at("abstract").at(language)])))

    abstract

    align(center, strong(text(size: 1.5em, [#commonPhrases.at("keywords").at(language)])))

    keywords
}

#let apply-pjatk-template(
    body,
    language: "en",
    faculty: "Faculty of Computer Science",
    department: "Name of your Specialization's Department",
    specialization: "Name of your Specialization",
    authors: ("Your Name --- s#####",),
    title: "Your Carefully Selected and Expressive Thesis Title",
    supervisor: "Supervisor's Name",
    auxiliary-supervisor: "Auxiliary Supervisor's Name",
    abstract: placeholder-abstract,
    keywords: placeholder-keywords,
    for-printing: false,
    faculty-pl: "Wydział Informatyki",
    department-pl: "Nazwa katedry",
    specialization-pl: "Nazwa specjalizacji",
    title-pl: "Twój strannie dobrawy i ekspresywny tytuł pracy dyplomowej",
    abstract-pl: "tłumaczenie streszczenia",
    keywords-pl: "tłumaczenie słów kluczowych",
) = {
    set document(title: title)

    let chosenMargins = if for-printing {
        (top: 1in, bottom: 1.25in, inside: 2.25in, outside: 1.25in)
    } else {
        (top: 1in, bottom: 1.25in, left: 1.75in, right: 1.75in)
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

    set par(leading: 0.55em, justify: true, spacing: 0.55em)

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
        highlight(
            radius: 4pt,
            fill: rgb(210, 235, 235, 80),
            extent: 0.5pt,
            top-edge: 1em,
            bottom-edge: -0.25em
        )[#it]
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
    show figure.caption: set block(sticky: true)

    set math.equation(numbering: "(1)")

    context {
        titlepage(
            language,
            chosenMargins,
            faculty,
            department,
            specialization,
            authors,
            title,
            supervisor,
            auxiliary-supervisor,
        )

        if text.lang == "en" {
            set text(lang: "pl")
            titlepage(
                "pl",
                chosenMargins,
                faculty-pl,
                department-pl,
                specialization-pl,
                authors,
                title-pl,
                supervisor,
                auxiliary-supervisor,
            )
            set text(lang: "en")
        } else {
            [~]
            pagebreak()
        }
    }

    set page(numbering: "1")

    context {
        abstractAndKeywords(language, abstract, keywords)

        if text.lang == "en" {
            pagebreak()
            set text(lang: "pl")
            abstractAndKeywords("pl", abstract-pl, keywords-pl)
            set text(lang: "en")
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

    bibliography(
        "references.bib",
    )

    context {
        outline(title: commonPhrases.at("list-of-listings").at(text.lang), target: figure.where(kind: raw))
        outline(title: commonPhrases.at("list-of-images").at(text.lang), target: figure.where(kind: image))
        outline(title: commonPhrases.at("list-of-tables").at(text.lang), target: figure.where(kind: table))
    }
}

