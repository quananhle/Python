## Calculate Amount Paid in Taxes

```Tag```: ```Array & String```

#### Difficulty: Medium

In a marginal tax rate system, as taxpayers make increasing amount of money, the tax rate they pay on every extra unit of income increases incrementally as their income passes certain cutoffs (referred to as "tax brackets").

Write a program in Python which takes 2 inputs:
1 - A vector of sorted pairs of doubles (cutoff ```bracket_cutoffs```, marginal tax rate ```bracket_rates```), where the marginal tax rate is expressed as decimal, describing the tax brackets in a marginal tax rate system
2 - An ```income``` amount as double that will calculate the amount of tax the taxpayer owes

__Companies:__ ```Bloomberg``` ```Interactive Broker```

---

__Example:__
```
Input:
bracket_cutoffs (input1) = [0, 1000.0]
bracket_rates (input2) = [0.1, 0.5]
income (input3) = 2000.0
Output:
answer = 600
```

---

```Python
def calculate_tax(bracket_cutoffs, bracket_rates, income):
    tax_owed = 0
    remaining_income = income
    
    for i in range(len(bracket_cutoffs)):
        if remaining_income <= 0:
            break
        
        if i == len(bracket_cutoffs) - 1:
            tax_owed += remaining_income * bracket_rates[i]
            break
        
        bracket_size = bracket_cutoffs[i + 1] - bracket_cutoffs[i]
        bracket_income = min(remaining_income, bracket_size)
        tax_owed += bracket_income * bracket_rates[i]
        remaining_income -= bracket_income
    
    return tax_owed
```
