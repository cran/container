% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/0-DictR6.R
\name{Dict}
\alias{Dict}
\title{Dict Class}
\description{
The \code{\link[=Dict]{Dict()}} resembles Python's dict type, and is implemented
as a specialized associative \code{\link[=Container]{Container()}}.
For the standard S3 interface, see \link[=Dict]{dict()}.
}
\details{
This class inherits from class \code{\link[=Container]{Container()}} and overwrides some
methods to account for the associative key-value pair semantic.
Internally, all key-value pairs are stored in a hash-table and the
elements are always sorted lexicographically by their keys.
}
\examples{
d = Dict$new(o = "one", na = NA, a = 1)
d
d$keys()

d$add("li", list(1, 2))
d$discard_at("na")
d$replace(1, 9)

d2 = Dict$new(a = 0, b = 1)
d$update(d2)
}
\seealso{
\code{\link[=Container]{Container()}}, \code{\link[=dict]{dict()}}
}
\section{Super classes}{
\code{\link[container:Iterable]{container::Iterable}} -> \code{\link[container:Container]{container::Container}} -> \code{Dict}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Dict-new}{\code{Dict$new()}}
\item \href{#method-Dict-add}{\code{Dict$add()}}
\item \href{#method-Dict-discard_at}{\code{Dict$discard_at()}}
\item \href{#method-Dict-get}{\code{Dict$get()}}
\item \href{#method-Dict-keys}{\code{Dict$keys()}}
\item \href{#method-Dict-remove}{\code{Dict$remove()}}
\item \href{#method-Dict-replace}{\code{Dict$replace()}}
\item \href{#method-Dict-set}{\code{Dict$set()}}
\item \href{#method-Dict-sort}{\code{Dict$sort()}}
\item \href{#method-Dict-update}{\code{Dict$update()}}
\item \href{#method-Dict-values}{\code{Dict$values()}}
\item \href{#method-Dict-clone}{\code{Dict$clone()}}
}
}
\if{html}{\out{
<details><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="container" data-topic="Iterable" data-id="iter"><a href='../../container/html/Iterable.html#method-Iterable-iter'><code>container::Iterable$iter()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="at"><a href='../../container/html/Container.html#method-Container-at'><code>container::Container$at()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="at2"><a href='../../container/html/Container.html#method-Container-at2'><code>container::Container$at2()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="clear"><a href='../../container/html/Container.html#method-Container-clear'><code>container::Container$clear()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="count"><a href='../../container/html/Container.html#method-Container-count'><code>container::Container$count()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="delete"><a href='../../container/html/Container.html#method-Container-delete'><code>container::Container$delete()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="delete_at"><a href='../../container/html/Container.html#method-Container-delete_at'><code>container::Container$delete_at()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="discard"><a href='../../container/html/Container.html#method-Container-discard'><code>container::Container$discard()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="empty"><a href='../../container/html/Container.html#method-Container-empty'><code>container::Container$empty()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="get_compare_fun"><a href='../../container/html/Container.html#method-Container-get_compare_fun'><code>container::Container$get_compare_fun()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="has"><a href='../../container/html/Container.html#method-Container-has'><code>container::Container$has()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="has_name"><a href='../../container/html/Container.html#method-Container-has_name'><code>container::Container$has_name()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="is_empty"><a href='../../container/html/Container.html#method-Container-is_empty'><code>container::Container$is_empty()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="length"><a href='../../container/html/Container.html#method-Container-length'><code>container::Container$length()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="names"><a href='../../container/html/Container.html#method-Container-names'><code>container::Container$names()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="peek_at"><a href='../../container/html/Container.html#method-Container-peek_at'><code>container::Container$peek_at()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="peek_at2"><a href='../../container/html/Container.html#method-Container-peek_at2'><code>container::Container$peek_at2()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="pop"><a href='../../container/html/Container.html#method-Container-pop'><code>container::Container$pop()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="print"><a href='../../container/html/Container.html#method-Container-print'><code>container::Container$print()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="rename"><a href='../../container/html/Container.html#method-Container-rename'><code>container::Container$rename()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="replace_at"><a href='../../container/html/Container.html#method-Container-replace_at'><code>container::Container$replace_at()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="size"><a href='../../container/html/Container.html#method-Container-size'><code>container::Container$size()</code></a></span></li>
<li><span class="pkg-link" data-pkg="container" data-topic="Container" data-id="type"><a href='../../container/html/Container.html#method-Container-type'><code>container::Container$type()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-new"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-new}{}}}
\subsection{Method \code{new()}}{
\code{Dict} constructor
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$new(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{initial elements put into the \code{Dict}}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
returns the \code{Dict}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-add"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-add}{}}}
\subsection{Method \code{add()}}{
If \code{name} not yet in \code{Dict}, insert \code{value} at \code{name},
otherwise signal an error.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$add(name, value)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{name}}{\code{character} variable name under which to store \code{value}.}

\item{\code{value}}{the value to be added to the \code{Dict}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
the \code{Dict} object
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-discard_at"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-discard_at}{}}}
\subsection{Method \code{discard_at()}}{
Discard value at given index. If index is not found,
the operation is ignored.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$discard_at(index)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{index}}{\code{character} or \code{numeric} index}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
the \code{Dict} object
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-get"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-get}{}}}
\subsection{Method \code{get()}}{
This function is deprecated. Use \code{\link[=at2]{at2()}} instead.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$get(key)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{key}}{\code{character} name of key.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
If \code{key} in \code{Dict}, return value at \code{key}, else throw error.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-keys"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-keys}{}}}
\subsection{Method \code{keys()}}{
Get all keys.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$keys()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
\code{character} vector of all keys.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-remove"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-remove}{}}}
\subsection{Method \code{remove()}}{
This function is deprecated. Use \code{\link[=delete]{delete()}} instead.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$remove(key)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{key}}{\code{character} name of key.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
If \code{key} in \code{Dict}, remove it, otherwise raise an error.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-replace"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-replace}{}}}
\subsection{Method \code{replace()}}{
Replace one element by another element.
Search for occurence of \code{old} and, if found, replace it by \code{new}.
If \code{old} does not exist, an error is signaled.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$replace(old, new)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{old}}{element to be replaced}

\item{\code{new}}{element to be put instead of old}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
the \code{Dict} object
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-set"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-set}{}}}
\subsection{Method \code{set()}}{
This function is deprecated. Use \code{\link[=replace]{replace()}} instead.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$set(key, value, add = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{key}}{\code{character} name of key.}

\item{\code{value}}{the value to be set}

\item{\code{add}}{\code{logical} if \code{TRUE} the value is set regardless whether
\code{key} already exists in \code{Dict}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
returns the \code{Dict}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-sort"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-sort}{}}}
\subsection{Method \code{sort()}}{
Sort elements according to their keys. This function
is deprecated as keys are now always sorted.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$sort(decr = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{decr}}{\code{logical} if \code{TRUE} sort in decreasing order.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
returns the \code{Dict}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-update"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-update}{}}}
\subsection{Method \code{update()}}{
Add elements of \code{other} to this if the name is
not in the \code{Dict} and update elements with existing names.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$update(other)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{other}}{\code{Iterable} object used to update this.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
returns the updated \code{Dict} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-values"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-values}{}}}
\subsection{Method \code{values()}}{
Get \code{Container} values
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$values()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
a copy of all elements in a list
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Dict-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Dict-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Dict$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
