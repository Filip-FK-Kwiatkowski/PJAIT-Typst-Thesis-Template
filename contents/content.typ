= Content

Be direct.
The thesis should be _as short as possible,
but not shorter than that_.
Meaning that
if you can be more concise without sacrificing readability or quality,
you should be.

Here you should explain in detail
the context of your work,
state-of-the-art of similar tools,
what is different about your approach, etc.
If it gets lengthy,
you can divide it into multiple chapters.

== How much to cite?

It is impossible to answer this question precisely.
A rule of thumb presents itself as follows:

- Copy-pasting an entire page of academic work
  without any citations is a *crime* (copyright).
- Each important aspect of your work
  that is not directly created by you,
  should be backed by citations.
- In the section dedicated to alternative sources / state-of-the-art,
  it is permitted to introduce grouped citations,
  e.g., by introducing a short summary
  and then providing many references at the same time.
- It is permitted to omit the citation of internet webpages
  if authors of referenced texts are unknown.
  In such situations you should reference the source broadly,
  e.g., "On IBM's website it can be seen that [...]."

Theses that were prepared and submitted
without the supervisor's active overseeing of the process of creating them
will be rejected.

== How to structure my work?

It is best to split your chapters
#footnote[Chapters. Not sections, not subsections. Entire chapters.]
into separate files.
Notice how this project consists of
`contents` directory with `introduction.typ` and `content.typ` inside,
which are then `#include`d in the `main.typ` file.
This makes it very easy to change the ordering,
separate different topics, and collaborate.

=== Manual numbering (of pretty much anything)

Do *not* include any numbering in the names of the files.
E.g., notice that the files are named `introduction.typ` and `content.typ`,
*not* `1-introduction.typ` and `2-content.typ`.
You do *not* want to create such dependencies.
Typst does the heavy-duty job of automatic numbering and ordering.
Do not interfere with it without a good reason.
What will happen if you spend a lot of time to number your files,
and then realize that you need to introduce a new file/chapter in the middle?
You're a programmer---apply and respect good programming practices.

== How to introduce other media content?

Typst provides a wide array of options to deal with inputting things like:

- code listings
- tables
- images
- equations

Let us inspect couple of examples.

=== Code listings

For inline code use ``` `backticks` ``` (the character above your Tab key),
and to introduce code listings use #raw("```triple backtics```") (preferably with specified language).
For example, to render @listing-Example-of-Kotlin-code-rendered-as-a-code-block,

#figure(
    caption: [Example of Kotlin code rendered as a code block.]
)[
```Kotlin
fun main() {
    val text = getStringOrNull()

    println(text?.length ?: "nothing")
}
```
]<listing-Example-of-Kotlin-code-rendered-as-a-code-block>

code from @listing-Example-of-typesetting-Kotlin-code was used.
Notice that listings' labels (with captions) are placed above them.

#figure(
    caption: [Code used to create @listing-Example-of-Kotlin-code-rendered-as-a-code-block.]
)[
````Typst
#figure(
    caption: [Example of Kotlin code rendered as a code block.]
)[
```Kotlin
fun main() {
    val text = getStringOrNull()

    println(text?.length ?: "nothing")
}
```
]<listing-Example-of-Kotlin-code-rendered-as-a-code-block>
````
]<listing-Example-of-typesetting-Kotlin-code>

Referencing listings is done using `@thisFamiliarSyntax`.
It searches for labels,
which in this are put after the listings
(e.g., `@listing-Example-of-Kotlin-code-rendered-as-a-code-block` creates the following reference: @listing-Example-of-Kotlin-code-rendered-as-a-code-block).

Currently, this template uses the Codly package @CodlyPackage @CodlyDocumentation,
but it's acceptable to present and suggest alternatives
(or at least help out with nicer rendering...).

=== Tables

Tables are very easy to make.
To make a table
that demonstrates how your final grade issued on a diploma
is calculated,
refer to @listing-Example-of-typesetting-tables.
The rendered table is @tab-Final-grade-calculations.

#figure(
    caption: [Components and calculations of your final grade issued on the diploma.]
)[
    #table(
        columns: (auto, 1fr),
        inset: 8pt,
        table.header([*Symbol*], [*Meaning*]),
        align: (center, left),
        [$a$],[Your GPA.],
        [$b_1$],[Thesis' grade by supervisor.],
        [$b_2$],[Thesis' grade by aux. supervisor.],
        [$c$],[Grade for thesis presentation.],
        [$d_1$],[Grade for answers to question \#1 from diploma exam.],
        [$d_2$],[Grade for answers to question \#2 from diploma exam.],
        [$d_3$],[Grade for answers to question \#3 from diploma exam.],
        table.cell(colspan: 2)[Final grade: $a/2+(b_1+b_2+c)/12+(d_1+d_2+d_3)/12$.]
    )
]<tab-Final-grade-calculations>

#figure(
    caption: [Example commands used to input a table.]
)[
````Typst
#figure(
    caption: "Components and calculations of your final grade issued on the diploma."
)[
    #table(
        columns: (auto, 1fr),
        inset: 8pt,
        table.header([*Symbol*], [*Meaning*]),
        align: (center, left),
        [$a$],[Your GPA.],
        [$b_1$],[Thesis' grade by supervisor.],
        [$b_2$],[Thesis' grade by aux. supervisor.],
        [$c$],[Grade for thesis presentation.],
        [$d_1$],[Grade for answers to question \#1 from diploma exam.],
        [$d_2$],[Grade for answers to question \#2 from diploma exam.],
        [$d_3$],[Grade for answers to question \#3 from diploma exam.],
        table.cell(colspan: 2)[Final grade: $a/2+(b_1+b_2+c)/12+(d_1+d_2+d_3)/12$.]
    )
]<tab-Final-grade-calculations>
````
]<listing-Example-of-typesetting-tables>

It is worth noting
that the calculated grade according to @tab-Final-grade-calculations
may be fractional.
How does it map to
the actual, discrete set of possible grades?
Consult @tab-Final-grade-clamp,
which,
for showcase purposes,
uses slightly different style.

#figure(
    caption: [Mapping of scored grade to the actual grade issued on the diploma.]
)[
    #table(
        columns: (auto, auto),
        inset: 8pt,
        table.header([*Scored grade range*], [*Resulting grade*]),
        align: center,
        [$[2.00;3.00)$], [$2.0$],
        [$[3.00;3.40)$], [$3.0$],
        [$[3.40;3.80)$], [$3.5$],
        [$[3.80;4.20)$], [$4.0$],
        [$[4.20;4.50)$], [$4.5$],
        [$[4.50;5.00)$], [$5.0$],
    )
]<tab-Final-grade-clamp>

=== Images (figures)

Including images is very easy.
@img-raw-Typst-logo is included as-is,
while @img-smaller-Typst-logo's width
was set to 50% (height was scaled automatically).

#figure(
    caption: [Typst's logo.]
)[
    #image("../Typst.png")
] <img-raw-Typst-logo>

#figure(
    caption: [Smaller Typst's logo.]
)[
    #image("../Typst.png", width: 50%)
] <img-smaller-Typst-logo>

Commands used to produce the above output are presented in @listing-Examples-of-image-usage.
Again,
like with tables,
images have labels
placed below them.

#figure(caption: [Example commands used to input images.])[
````Typst
#figure(
    caption: "Typst's logo."
)[
    #image("../Typst.png")
] <img-raw-Typst-logo>

#figure(
    caption: "Smaller Typst's logo."
)[
    #image("../Typst.png", width: 80%)
] <img-smaller-Typst-logo>
````
]<listing-Examples-of-image-usage>

=== Equations

Use LaTeX-like syntax.
For inline equations,
wrap them in a pair of dollar signs (`$`).
For example,
this: `$a x^2+b x+c=0$` will produce: $a x^2+b x+c=0$.
For numbered equations
that are displayed separately,
introduce additional space
between the dollar sign and the equation.
For example,
typing `$ a x^2+b x+c=0 $`
(notice the additional space after the first and before the last `$`---`$ ` and ` $`)
will produce: $ a x^2+b x+c=0 $

Of course,
they are numbered
(thus should be referencable),
so instead of
`$ a x^2+b x+c=0 $`
one should type
`$ a x^2+b x+c=0 $ <eq-Quadratic-example>`
so that it's rendered like this:
$ a x^2+b x+c=0 $ <eq-Quadratic-example>

and referenced like this: @eq-Quadratic-example.

=== Figure functions

Notice that in case of
listings, tables, and images,
they were wrapped inside a `#figure` call.
This makes them
referencable, have captions,
and be correctly labeled.
Without the `#figure` function call,
they are rendered as-is,
without being correctly labeled.
There are,
of course,
valid use cases for that---the university's logo
displayed on the title page
is an example of such construct.
Professionally,
images are labeled as _figures_,
so make sure the distinction is understood.