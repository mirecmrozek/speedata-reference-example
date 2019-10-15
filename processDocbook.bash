asciidoctor cheatsheet.adoc -b docbook
sed '/^<?.*?>$/d' cheatsheet.xml | sed -r 's/<xref linkend="([a-zA-Z0-9]*)"\/>/__\1__/g' > data.xml
sp --prepend-xml=fonts.xml --prepend-xml=pagination.xml
