
COLOR_LIGHT_PURPLE='\033[0;35m'
COLOR_NC='\033[0m' # No Color



podstop() {
    kubectl get pods | grep $1 | awk '{print $1}' | 
        while read po;
        do 
            kubectl top pod $po;
        done;
}

getallpods() {

    kubectl config get-contexts -oname |  
        while read context; 
        do 
            echo -e "${COLOR_LIGHT_PURPLE}$context${COLOR_NC}"; 
            kubectl get po -owide --context=$context | grep $1;
        done

}
