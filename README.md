# PJAIT thesis template written in Typst

This repository consists of two main files:
- `main.typ`, that is used to render your document (the thesis' documentation)
- `pjatk-template.typ`, which automates the styling of your document,
  including the generation of title pages
  in accordance with university's requirements

## How do I use it?

**In summary**: You clone this repository,
you write content (text, images, tables, code listings, ...)
in `.typ` files
that you `#include` in your `main.typ` file,
and you compile that `main.typ` file.
This process creates a PDF.

**In detail**: This template uses [Typst](https://typst.app/),
so, theoretically, you will need _some_ understanding of this tool
before you jump into writing your thesis.
In practice, though, that's not necessarily the case.
In most cases, simple markdown-like formatting will be sufficient.

The sample document 
(the PDF rendered from `main.typ`, called `main.pdf`) 
explains almost everything you need
to typeset
(write and include)
the final content of your thesis.

Typst needs a [compiler](https://typst.app/open-source/#download).
It's a very small, self-contained `.exe`.
It's also very simple — just run `./typst compile main.typ --font-path="./contents/assets/fonts"`,
assuming you have downloaded and placed your `typst.exe` (the compiler)
in your project (next to the project files).

It's even easier if you:
- installed the used fonts in your system — then you can omit the `--font-path="./contents/assets/fonts"` part.
- added `typst.exe` to your PATH — then you can omit the `./` from `./typst`.
- use an alias — instead of `compile`, you can type `c`.

Thus, the shortest form becomes: `typst c main.typ`.

> [!TIP]
> Read the rendered document (`main.pdf`).
> It showcases more examples of what you can do with Typst.
> It also covers basic information
> regarding how to structure your thesis.

## Why would I use Typst instead of MS Word, Google Docs, or LaTeX?

Short answer(s):
- LaTeX is very cumbersome to use.
  It has a steep learning curve,
  and its complexity will not yield any benefits to you.
- MS Word and Google Docs are the most convenient to start with,
  but quickly become unreliable when your document grows.
  In many cases they quietly introduce bugs to your document.

Typst is fairly easy to learn.
And you don't even have to learn it well,
given that you are supplied with this repository's template.

Typst is robust and produces correct documents _quickly_.

Typst is text-based, rather than binary-based,
which means that it's perfect to use
with version control systems, like Git.
This also means that collaboration and revision
may be very straightforward yet effective and robust
— simply by employing (e.g., GitHub) issues and pull requests. 

## Okay, so how do I change the look of my document? I need to typeset my own title, my own name, my supervisor's name, etc.

Some, required to be present, elements
are customizable via the template's main function's arguments
— `apply-pjatk-template.with(...)`.

For example, if your name is _General CePlus_,
your student number is _s213742069_,
and your title is _Library for visualization of stack and heap in C++ programs_,
you would apply the template in the following manner:

```typst
#show: apply-pjatk-template.with(
    authors: ("General CePlus --- s213742069",),
    title: "Library for visualization of stack and heap in C++ programs"
)
```

Want to add your supervisor's name?
There's an argument for that too
— called `supervisor`:

```typst
#show: apply-pjatk-template.with(
    authors: ("General CePlus --- s213742069",),
    title: "Library for visualization of stack and heap in C++ programs",
    supervisor: "M.Eng. CeePlusPlus Wizard"
)
```

The documentation for all arguments
can be found [at the end of this document](#documentation-for-apply-pjatk-template-function-arguments).

## I don't like that inline code has a blue background

Call `apply-pjatk-template()` function
`with` the following argument: `highlight-inline-code: false`.

## Is there an argument for **everything**?

No.

To change some things,
you may need to change the template code
(e.g., for changing how code blocks are rendered)
or apply a new [set / show rule](https://typst.app/docs/reference/styling/)
in your document(s).

## Documentation for `apply-pjatk-template()` function arguments

> [!NOTE]
> The university requires theses written in English
> to meet some additional requirements.
> Because of this, some arguments may seem duplicated.
> Read below for further information.

The documentation structure is as follows:
> `argument_name: "default_value"` (applicable languages).

For example, "`language: "en"` (🇬🇧+🇵🇱)" means
that there is an argument called `language`
with default value `"en"`,
that should be specified for both English (🇬🇧)
and Polish (🇵🇱) theses.

Another example is "`supervisor-pl: "Imię i nazwisko promotora"` (🇬🇧)".
This is a `supervisor-pl` argument with default value `"Imię i nazwisko promotora"`,
that should be provided
only if you are writing your thesis
in English (🇬🇧).

In summary, arguments with `-pl` suffix are translations
for Enlgish theses.

- `language: "en"` (🇬🇧+🇵🇱)

  Specifies the language for your document.
  Polish and English have different rules
  for hyphenation, quotes, and some other things
  that Typst correctly handles,
  assuming that you have set the correct language.
- `faculty: "Faculty of Computer Science"` (🇬🇧+🇵🇱)
  
  Name of the faculty.
- `department: "Name of your Specialization's Department"` (🇬🇧+🇵🇱)

  Name of the department of your specialization.
  Best to consult your supervisor
  to correctly identify this name.
- `specialization: "Name of your Specialization"` (🇬🇧+🇵🇱)

  Name of your specialization.
  You should know it.
- `authors: ("Your Name --- s#####",)` (🇬🇧+🇵🇱)

  Array of authors' full names and index numbers.
  Notice the plural form.
  If you are developing your thesis by yourself,
  supply your information in a string
  with a single trailing comma,
  enclosed in parentheses.

  If you need to supply more authors,
  simply provide multiple strings
  separated by commas.
  Also notice that you use three dashes (`---`)
  between the full name and the index number.

  For example, if you have three authors,
  you would do:
  `authors: ("First One --- s00001", "Second One --- s00002", "Third One --- s00003")`.
- `title: "Your Carefully Selected and Expressive Thesis Title"` (🇬🇧+🇵🇱)
  
  Your title.
  Use Title Case for English titles.
- `supervisor: "Supervisor's Name"` (🇬🇧+🇵🇱)

  Name of your supervisor.
  Remember to include their academic title.
  Ask if unsure.
- `supervisor-pl: "Imię i nazwisko promotora"` (🇬🇧)
  
  Polish translation for your supervisor's full name
  and their academic title.
- `reviewer: "Reviewer's Name"` (🇬🇧+🇵🇱)
  
  Name of your reviewer.
  Remember to include their academic title.
  Ask if unsure.
- `reviewer-pl: "Imię i nazwisko recenzenta"` (🇬🇧)

  Polish translation for your reviewer's full name
  and their academic title.
- `abstract: placeholder-abstract` (🇬🇧+🇵🇱)

  Abstract is your summary.
  Most readers determine whether it's worth
  to read your work based on what they have read
  in your abstract.
  Make it good.
- `keywords: placeholder-keywords` (🇬🇧+🇵🇱)

  Keywords are akin to tags.
  Use them wisely.
- `for-printing: false` (🇬🇧+🇵🇱)

  If set to `false`, margins will be mirrored
  (the "normal" behavior).
  When set to `true`, margins will alternate between pages
  to accommodate for binding of the printed work.
  Try it out, because it rarely makes sense
  for people, who have never encountered it.
- `faculty-pl: "Wydział Informatyki"` (🇬🇧)

  Translation of your faculty.
- `department-pl: "Nazwa katedry"` (🇬🇧)

  Translation of your department.
- `specialization-pl: "Nazwa specjalizacji"` (🇬🇧)

  Translation of your specialization.
- `title-pl: "Twój starannie dobrany i ekspresywny tytuł pracy dyplomowej"` (🇬🇧)

  Translation of your title.
  Do **not** use Title Case here.
- `abstract-pl: "Tłumaczenie streszczenia."` (🇬🇧)

  Translation of your abstract.
- `keywords-pl: "Tłumaczenie słów kluczowych."` (🇬🇧)
  
  Translation of your keywords.
- `highlight-inline-code: true` (🇬🇧+🇵🇱)
  
  Whether to add lightblue highlight
  for inline code.
  Some printers may be unable
  to handle it well.

