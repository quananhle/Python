## [465. Optimal Account Balancing](https://leetcode.com/problems/optimal-account-balancing/)

```Tag```: ```Backtracking``` ```Bitwise Operations```

#### Difficulty: Hard

You are given an array of transactions ```transactions``` where ```transactions[i] = [fromi, toi, amounti]``` indicates that the person with ```ID = fromi``` gave ```amounti``` $ to the person with ```ID = toi```.

Return _the minimum number of transactions required to settle the debt_.

![image](https://github.com/quananhle/Python/assets/35042430/0e02bfb3-2a99-4c90-8b84-e6e89847f497)

---

__Example 1:__
```
Input: transactions = [[0,1,10],[2,0,5]]
Output: 2
Explanation:
Person #0 gave person #1 $10.
Person #2 gave person #0 $5.
Two transactions are needed. One way to settle the debt is person #1 pays person #0 and #2 $5 each.
```

__Example 2:__
```
Input: transactions = [[0,1,10],[1,0,1],[1,2,5],[2,0,5]]
Output: 1
Explanation:
Person #0 gave person #1 $10.
Person #1 gave person #0 $1.
Person #1 gave person #2 $5.
Person #2 gave person #0 $5.
Therefore, person #1 only need to give person #0 $4, and all debt is settled.
```

__Constraints:__

- ```1 <= transactions.length <= 8```
- ```transactions[i].length == 3```
- ```0 <= fromi, toi < 12```
- ```fromi != toi```
- ```1 <= amounti <= 100```

---

Rather than focusing on the debt relationships between each pair of individuals, we can direct our attention towards the net balance of each person. For instance, person ```1``` is owed ```5``` by person ```2```, but owes ```10``` to person ```3``` and ```10``` to person ```4```. Therefore, person ```1``` owes a net ```15```.

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/1.png)

As a result, we can envision an "institution" independent of all persons. If a person has a positive balance, he can clear his debt by transferring his balance to the institution in one transaction. Likewise, if a person has a negative balance, he can also clear his debt by withdrawing the owed balance from the institution in a single transaction. Therefore, it would take a maximum of nnn transactions to settle each person's debt.

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/2.png)

Additionally, we can even let one of the ```n``` individuals act as the institution, so the other ```n−1``` individuals can settle their debts in ```n−1``` transactions. Since the total debt sum is ```0```, clearing the debts of the first ```n−1``` individuals would automatically clear the debt of the $n^{th}$ person. Note that this idea applies to any group of people whose total debt sum is ```0```, not just all ```n``` individuals as a group.

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/3.png)

Consequently, our initial step involves calculating the net balance of each person from all transactions. If a person's total balance is not zero, we store his net balance in a list.

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/5.png)

If the list is empty, it implies that all persons have zero debt, and the problem can be solved with 0 transactions. Otherwise, we will proceed with working on the list of net balances.

### Backtracking

__Algorithm__

1. Create a hash map ```balance_sheet``` to store the net balance of each person.
2. Collect all non-zero net balance in an array ```net_balances```.

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/6.png)

3. Define a recursive function ```dfs(curr)``` to clear all balances in the range ```net_balances[0 ~ curr]```:
4. Ignore ```curr``` if the balance is already ```0```. While ```net_balances[curr] = 0```, proceed to the next person by incrementing ```curr``` by ```1```.
    - If ```curr = n```, return ```0```.
    - Otherwise, set ```ans``` to a large integer like ```inf```.
  
![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/7.png)

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/8.png)

5. Traverse through the index of ```next``` from ```curr + 1```, if ```net_balances[next] * net_balances[curr] < 0```,
    - Add the balance of ```net_balances[curr]``` to ```net_balances[next]```: ```net_balances[next] += balance_list[curr]```.
    - Recursively call ```dfs(curr + 1)``` as ```dfs(curr) = 1 + dfs(curr + 1)```.
    - Remove the previous transferred balance from ```curr: net_balances[next] -= net_balances[curr]``` (backtracking).
  
![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/9.png)

6. Repeat from step 5 and keep tracking of the minimum number of operations of ```ans = min(ans, 1 + dfs(curr + 1))``` encountered in the iteration. Return ans when the iteration is complete.
7. Return ```dfs(0)```.

![image](https://github.com/quananhle/Python/assets/35042430/bfad9d68-2f98-466c-8a06-6b839451206e)

```Python
class Solution:
    def minTransfers(self, transactions: List[List[int]]) -> int:
        balance_sheet = collections.defaultdict(int)
        for u, v, amount in transactions:
            balance_sheet[u] += amount
            balance_sheet[v] -= amount
        
        net_balances = [amount for amount in balance_sheet.values() if amount]
        n = len(net_balances)

        def dfs(curr):
            # Base cases: 
            # Move to the next person if current person has no debt
            while curr < n and not net_balances[curr]:
                curr += 1
            # Correct path, no more transaction
            if curr == n:
                return 0
            
            ans = float('inf')
            for next in range(curr + 1, n):
                # Check if current person and next person has debt to settle
                if net_balances[curr] * net_balances[next] < 0:
                    net_balances[next] += net_balances[curr]
                    ans = min(ans, 1 + dfs(curr + 1))
                    net_balances[next] -= net_balances[curr]
                
            return ans

        return dfs(0)
```
