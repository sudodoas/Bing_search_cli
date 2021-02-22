#!/bin/sh

echo "Type in a search query:"

#read QUERY
#QUERY=$(cat ~/code/spam/beemovie.txt | dmenu -p "What images do you want to search for" -fn monospace:size=15 -nb "#282c34" -nf "#bbbbbb" -sb "#3071db" -sf "#282c34")
#QUERY=$(cat ~/code/spam/beemovie.txt | fzf)
read QUERY

echo "#!/bin/sh" > ~/.local/tmp/bingsearch.sh
echo "cd ~/.local/tmp/" >> ~/.local/tmp/bingsearch.sh
echo "rm *=*" >> ~/.local/tmp/bingsearch.sh


curl "https://www.bing.com/images/search?q=$QUERY&form=QBLH&sp=-1&pq=$QUERY&sc=8-4&qs=n&cvid=374ABE0AFA67447AA129F7F8CA6FA78E&first=1&tsc=ImageBasicHover" |
    pup -c |
    grep img --color |
    grep -E  -o  \"'http.*1.1'\" --color >> ~/.local/tmp/bingsearch.sh


    sed -i 's/"http/wget "http/g' ~/.local/tmp/bingsearch.sh
    sed -i 's/1"/1" \\/g' ~/.local/tmp/bingsearch.sh

sh ~/.local/tmp/bingsearch.sh    

sxiv ~/.local/tmp
