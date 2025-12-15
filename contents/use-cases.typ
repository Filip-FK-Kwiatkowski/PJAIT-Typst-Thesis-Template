= Use cases

Use cases
allow for:
- quick estimates
  regarding project's complexity and scope;
- easy and reliable way
  to inspect the details
  of the user-application interaction.

Since even very small applications
may consist of a great number
of use cases,
it is recommended to provide
many smaller sub-diagrams
rather than
one, big, complete diagram.

Some applications
(e.g., CLI tools or programming libraries)
are less suitable
for describing their features
using use cases.
Those scenarios should be handled individually.
For example,
a CLI application may have
a *Usage* or *Commands and grammar* chapter,
where you comprehensively explain
how a given tool can be used.
Sort of like a `--help` flag.

== Selected use case scenarios

For some use cases,
it is worth to introduce detailed scenarios.
It is usually the case for
complicated use cases,
or use cases that are
the main features
of the applications.

Do _not_ include
use case diagrams or use case scenarios
as raster images (screenshots / `.png` / `.jpeg`, ...).
Use vector graphics
or a dedicated Typst tool
that renders them.