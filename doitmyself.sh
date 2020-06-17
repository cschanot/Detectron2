multiple_cmd() { 
    current_time=$(date "+%Y.%m.%d-%H.%M.%S")
    python ppl.py --input $1 --output output/$1_$current_time.jpg
}; 
export -f multiple_cmd;
while true 
do
sleep 50
find /CAM/Alerts/Out* -newerct '1 minute ago' -exec bash -c 'multiple_cmd "$0"' {} \;
done
