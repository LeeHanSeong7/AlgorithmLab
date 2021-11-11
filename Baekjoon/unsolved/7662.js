function inputReader(file, spliter){
    this.input = require('fs').readFileSync(file).toString().split(spliter)
    this.idx = 0
    this.read = ()=> this.idx < this.input.length ? this.input[this.idx++] : null
    this.readInt = ()=>parseInt(this.read())
    this.readIntList = (spliter)=>this.read().split(spliter).map(e=>parseInt(e))
}
const reader = new inputReader('input.txt', "\r\n")
//const reader = new inputReader('/dev/stdin', "\n")

function MMheap(){
    const arr = []
    function isMinlvl(i){
        return Math.floor(Math.log2(i))%2 == 0 ? true : false
    }
    function getChild(i){
        if (arr in i*2+2)
            return [arr[i*2+2], arr[i*2+1]]
        else if (arr in i*2+1)
            return [arr[i*2+1]]
        else
            return []
    }
    function getParent(i){
        return Math.floor((i-1)/2)
    }
    function push_down(i){
        if (isMinlvl(i))
            push_down_min(i)
        else
            push_down_max(i)
    }
    function push_down_min(i){
        let childs = getChild(i)
        if (childs.length != 0){
            let grandChilds = []
            for(child of childs)
                grandChilds.concat(getChild(child))
            let m = [...childs,...grandChilds].reduce((a,c)=>arr[a] < arr[c] ? a : c)
            if (grandChilds.includes(m)){
                if (arr[m] < arr[i]){
                    arr[m],arr[i] = arr[i],arr[m]
                    let parent = getParent(m)
                    if (arr[m] > arr[parent])
                        arr[m],arr[parent] = arr[parent],arr[m]
                    push_down_min(m)
                }
            }
            else if (arr[m] < arr[i])
                arr[m],arr[i] = arr[i],arr[m]
        }
    }
    function push_down_max(i){
        let childs = getChild(i)
        if (childs.length != 0){
            let grandChilds = []
            for(child of childs)
                grandChilds.concat(getChild(child))
            let m = [...childs,...grandChilds].reduce((a,c)=>arr[a] > arr[c] ? a : c)
            if (grandChilds.includes(m)){
                if (arr[m] > arr[i]){
                    arr[m],arr[i] = arr[i],arr[m]
                    let parent = getParent(m)
                    if (arr[m] < arr[parent])
                        arr[m],arr[parent] = arr[parent],arr[m]
                    push_down_max(m)
                }
            }
            else if (arr[m] < arr[i])
                arr[m],arr[i] = arr[i],arr[m]
        }
    }
}

const T = reader.readInt()

for(let i=0; i<T; i++)
    solution()

function solution(){
    const K = reader.readInt()
    const queue = new PriorityQueue()
    for(let i=0; i<K; i++){
        let [opr,num] = reader.read().split(' ')
        if (opr == 'I')
            queue.enQueue(parseInt(num))
        else{
            if (num == '-1')
                console.log(queue.deQueueMin())
            else
                console.log(queue.deQueueMax())
        }
    }
    let max = queue.getMax();
    if (max !== null)
        console.log(max+' '+queue.getMin()[1])
    else
        console.log('EMPTY')
}