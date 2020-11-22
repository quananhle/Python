from collections import OrderedDict

#input:
col = []
result_col = []
edges = {}
trees = []
n = int(input("Enter size of matrix: "))
print("\nplease enter the elements row by row separated by spaces")
for i in range(0, n):
    while(True):
        row = list(map(int,input("\nEnter the " + str(i+1) + "th row : ").strip().split()))[:n] 
        if (len(row) == n):
            break;
        else:
            print("wrong number of elements. please enter " + str(n) + " elements")
    #save row
    col.append(row)
    for idx, val in enumerate(row):
        if idx > i:
            #included negative values
            #print(i, idx, val)
            #save edges in format: (row, col): val
            edges[(i, idx)] = val

print("input matrix: ")
for row in col:
    print(row)

sortedEdges = OrderedDict(sorted(edges.items(), key=lambda x: x[1]))
toBeDeleted = []
for key, val in sortedEdges.items():

    if val > 0:
        
        #print("\tkeys "+ str(key))
        #add into tree:
        #if trees is empty:
        if not trees:
            smalltree = []
            smalltree.append(key[0])
            smalltree.append(key[1])  
            trees.append(smalltree)
            #this edge stays
        #if not empty
        else:
            #print("ongoing:")
            #print(key)

            presence0 = 0
            presence1 = 0
            idx_0 = -1
            idx_1 = -1
            connects = 0
            for idx, smalltree in enumerate(trees):
                if (key[0] in smalltree and presence1 == 1) or (key[1] in smalltree and presence0 == 1):
                    #combine
                    nowidx = idx_0
                    if presence1 == 1:
                        nowidx = idx_1

                    for x in trees[idx]:
                        trees[nowidx].append(x)
                    trees.pop(idx)
                    presence1 = 1
                    presence0 = 1
                    connects = 1
                    break;
                
                if key[0] in smalltree and presence0 == 0:
                    #print("first element present.")
                    presence0 = 1
                    idx_0 = idx
                if key[1] in smalltree and presence1 == 0:
                    #print("second element present.")
                    presence1 = 1
                    idx_1 = idx


            if presence0 == 0 and presence1 == 0:
                #print("not present")
                smalltree = []
                smalltree.append(key[0])
                smalltree.append(key[1])
                trees.append(smalltree)
                #thhis edge stays
            elif presence0 == 0 and presence1 == 1:
                trees[idx_1].append(key[0])
            elif presence0 == 1 and presence1 == 0:
                trees[idx_0].append(key[1])
            else:
                if len(trees) == 1 and connects == 0:
                    toBeDeleted.append(key)

#print(toBeDeleted)
#print("sorted edges:")
#print(sortedEdges)
for key in toBeDeleted:
    sortedEdges[key] = -1
#print("sorted edges after delete:")
#print(sortedEdges)
#print("trees:")
#print(trees)
for i in range(0, n):
    row = []
    for j in range(0, n):
        if i < j:
            row.append(sortedEdges[(i, j)])
        if i == j:
            row.append(0)
        if i > j:
            #inverted
            row.append(sortedEdges[(j, i)])
    result_col.append(row)

print("onput matrix: ")
for row in result_col:
        print(row)

#print(sortedEdges
#sort edges:



