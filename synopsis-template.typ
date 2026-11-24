#let apply-synopsis-template(
    language: "en",
    authors: ("",),
    title: "",
    body
) = {
    let accent-color = rgb("#be161e")
    let terms = yaml("terms.yaml").at(language)

    set page(
        height: auto,
        margin: (bottom: 1.5in, top: 1in, rest: 1.75in),
    )

    set text(
        size: 13pt,
        lang: language,
    )

    let margin-numbering-width = 1.5cm

    set heading(numbering: "1.")
    show heading: set text(hyphenate: false)

    show divider: it => context {
        v(1.5em, weak: true)
        line(
            stroke: 0.5pt + luma(100),
            start: (25%, 0%),
            end: (75%, 0%),
        )
       v(1em, weak: true)
    }

    text(
        size: 40pt,
        fill: gradient.linear(accent-color, accent-color.lighten(15%)),
        smallcaps(lower(terms.synopsis))
    )

    context v(par.leading, weak: true)

    line(
        length: 100%,
        stroke: 3pt + gradient.linear(
            (accent-color, 0%),
            (accent-color.lighten(15%), 50%),
            (white, 100%)
        ),
    )

    {
        set text(fill: luma(100))

        if (authors.len() > 1) {
            terms.authors + [:]
            list(..authors)
        } else {
            terms.author + [: ] + authors.join()
        }
    }

    parbreak()

    text(
        size: 17pt,
        fill: luma(50),
        title
    )

    v(2em)

    body
}