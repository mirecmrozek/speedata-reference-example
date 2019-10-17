# create source xml
asciidoctor cheatsheet.adoc -b docbook

# replace <emphasis> with <b> and <i> tags
perl -0777 -i -pe "s/\<emphasis role=\"strong\"\>([^\<\>]*)\<\/emphasis\>/\&lt;b\&gt;\1\&lt;\/b\&gt;/gm" cheatsheet.xml
perl -0777 -i -pe "s/\<emphasis\>([^\<\>]*)\<\/emphasis\>/\&lt;i\&gt;\1\&lt;\/i\&gt;/gm" cheatsheet.xml
perl -0777 -i -pe "s/\<emphasis role=\"strong\"\>([^\<\>]*)\<\/emphasis\>/\&lt;b\&gt;\1\&lt;\/b\&gt;/gm" cheatsheet.xml

# replace reference tags with our own syntax
sed '/^<?.*?>$/d' cheatsheet.xml | sed -r 's/<xref linkend="([a-zA-Z0-9]*)"\/>/__\1__/g' > data.xml

# include files
sp --prepend-xml=fonts.xml --prepend-xml=pagination.xml
