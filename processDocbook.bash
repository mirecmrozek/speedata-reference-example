# create source xml
asciidoctor data.adoc -b docbook -o data.xml

# replace <emphasis> with <b> and <i> tags
perl -0777 -i -pe "s/\<emphasis role=\"strong\"\>([^\<\>]*)\<\/emphasis\>/\&lt;b\&gt;\1\&lt;\/b\&gt;/gm" data.xml
perl -0777 -i -pe "s/\<emphasis\>([^\<\>]*)\<\/emphasis\>/\&lt;i\&gt;\1\&lt;\/i\&gt;/gm" data.xml
perl -0777 -i -pe "s/\<emphasis role=\"strong\"\>([^\<\>]*)\<\/emphasis\>/\&lt;b\&gt;\1\&lt;\/b\&gt;/gm" data.xml

# delete <?> tags which confuse speedata
sed '/^<?.*?>$/d' -i data.xml
# replace reference tags with our own syntax
sed data.xml -ri's/<xref linkend="([a-zA-Z0-9]*)"\/>/__\1__/g'

# include files
sp --prepend-xml=fonts.xml --prepend-xml=pagination.xml
