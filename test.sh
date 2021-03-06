#!/bin/sh

echo "Type in a search query:"

read QUERY


echo "#!/bin/sh" > ~/.local/tmp/bingsearch.sh
echo "cd ~/.local/tmp/bing_images" >> ~/.local/tmp/bingsearch.sh
echo "rm *" >> ~/.local/tmp/bingsearch.sh


choice=$(curl "https://www.bing.com/images/search?q=$QUERY&form=HDRSC2&first=1&tsc=ImageBasicHover" |
    pup -c |
    grep --color -E -o '"https://th.bing.*"' >> ~/.local/tmp/bingsearch.sh)

echo $choice

sed -i 's/"http/wget "http/g' ~/.local/tmp/bingsearch.sh

#    sed -i 's/href="//g' ~/.local/tmp/bingsearch.sh
#    sed -i 's/http/wget "http/g' ~/.local/tmp/bingsearch.sh
#    sed -i 's/1"/1" \\/g' ~/.local/tmp/bingsearch.sh

sh ~/.local/tmp/bingsearch.sh    

sxiv ~/.local/tmp/bing_images/
