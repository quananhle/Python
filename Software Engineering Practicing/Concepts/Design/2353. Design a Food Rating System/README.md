## [2353. Design a Food Rating System](https://leetcode.com/problems/design-a-food-rating-system)

```Tag```: ```Design``` ```Priority Queue``` ```Hash Map```

#### Difficulty: Medium

Design a food rating system that can do the following:

- __Modify__ the rating of a food item listed in the system.
- Return the highest-rated food item for a type of cuisine in the system.

Implement the ```FoodRatings``` class:

- ```FoodRatings(String[] foods, String[] cuisines, int[] ratings)``` Initializes the system. The food items are described by ```foods```, ```cuisines``` and ```ratings```, all of which have a length of ```n```.
  - ```foods[i]``` is the name of the $i^{th}$ food,
  - ```cuisines[i]``` is the type of cuisine of the $i^{th}$ food, and
  - ```ratings[i]``` is the initial rating of the $i^{th}$ food.
- ```void changeRating(String food, int newRating)``` Changes the rating of the food item with the name ```food```.
- ```String highestRated(String cuisine)``` Returns the name of the food item that has the highest rating for the given type of ```cuisine```. If there is a tie, return the item with the __lexicographically smaller__ name.

Note that a string ```x``` is lexicographically smaller than string ```y``` if ```x``` comes before ```y``` in dictionary order, that is, either ```x``` is a prefix of ```y```, or if ```i``` is the first position such that ```x[i] != y[i]```, then ```x[i]``` comes before ```y[i]``` in alphabetic order.

![image](https://github.com/quananhle/Python/assets/35042430/43ef2cad-cfa2-4308-9762-73006afe4d94)

---

__Example 1:__
```
Input
["FoodRatings", "highestRated", "highestRated", "changeRating", "highestRated", "changeRating", "highestRated"]
[[["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"], ["korean", "japanese", "japanese", "greek", "japanese", "korean"], [9, 12, 8, 15, 14, 7]], ["korean"], ["japanese"], ["sushi", 16], ["japanese"], ["ramen", 16], ["japanese"]]
Output
[null, "kimchi", "ramen", null, "sushi", null, "ramen"]

Explanation
FoodRatings foodRatings = new FoodRatings(["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"], ["korean", "japanese", "japanese", "greek", "japanese", "korean"], [9, 12, 8, 15, 14, 7]);
foodRatings.highestRated("korean"); // return "kimchi"
                                    // "kimchi" is the highest rated korean food with a rating of 9.
foodRatings.highestRated("japanese"); // return "ramen"
                                      // "ramen" is the highest rated japanese food with a rating of 14.
foodRatings.changeRating("sushi", 16); // "sushi" now has a rating of 16.
foodRatings.highestRated("japanese"); // return "sushi"
                                      // "sushi" is the highest rated japanese food with a rating of 16.
foodRatings.changeRating("ramen", 16); // "ramen" now has a rating of 16.
foodRatings.highestRated("japanese"); // return "ramen"
                                      // Both "sushi" and "ramen" have a rating of 16.
                                      // However, "ramen" is lexicographically smaller than "sushi".
```

__Constraints:__

- $1 \le n \le 2 * 10^4$
- ```n == foods.length == cuisines.length == ratings.length```
- $1 \le foods[i].length, cuisines[i].length \le 10$
- ```foods[i]```, ```cuisines[i]``` consist of lowercase English letters.
- $1 \le ratings[i] \le 10^8$
- All the strings in ```foods``` are distinct.
- ```food``` will be the name of a food item in the system across all calls to ```changeRating```.
- ```cuisine``` will be a type of cuisine of at least one food item in the system across all calls to ```highestRated```.
- At most $2 * 10^4$ calls in total will be made to ```changeRating``` and ```highestRated```.

---

### Priority Queue + Hash Map

![image](https://leetcode.com/problems/design-a-food-rating-system/Figures/2353/Slide4.jpg)

![image](https://leetcode.com/problems/design-a-food-rating-system/Figures/2353/Slide5.jpg)

![image](https://leetcode.com/problems/design-a-food-rating-system/Figures/2353/Slide2.jpg)

![image](https://leetcode.com/problems/design-a-food-rating-system/Figures/2353/Slide3.jpg)

```Python
class Food:

    def __init__(self, food_rating, food_name):
        # Store the food's rating
        self.food_rating = food_rating
        # Store the food's name
        self.food_name = food_name
    
    def __lt__(self, other):
        # Check if food ratings are the same, sort based on their name (lexicographically smaller name food will be on top).
        if self.food_rating == other.food_rating:
            return self.food_name < other.food_name
        # Sort based on food rating (bigger rating food will be on top)
        return self.food_rating > other.food_rating

class FoodRatings:

    def __init__(self, foods: List[str], cuisines: List[str], ratings: List[int]):
        # Map food with its rating
        self.food_rating_map = collections.defaultdict()
        # Map food with its cuisine
        self.food_cuisine_map = collections.defaultdict()
        # Store all food of a cuisine in a priority queue (to sort them on ratings/name).
        # Priority queue element -> Food: (food_rating, food_name)
        self.h = collections.defaultdict(list)

        n = len(foods)
        for i in range(n):
            self.food_rating_map[foods[i]] = ratings[i]
            self.food_cuisine_map[foods[i]] = cuisines[i]
            heapq.heappush(self.h[cuisines[i]], Food(ratings[i], foods[i]))

    def changeRating(self, food: str, newRating: int) -> None:
        # Update food's rating 
        self.food_rating_map[food] = newRating
        # Get cuisine of food
        cuisine = self.food_cuisine_map[food]
        # Insert new element to priority queue
        heapq.heappush(self.h[cuisine], Food(newRating, food))

    def highestRated(self, cuisine: str) -> str:
        # for pairs in self.guide[cuisine]:
        highest_rated = self.h[cuisine][0]
        # Check if the largest rating of food rating map matches the highest rating of food in cuisine from priority queue
        while self.food_rating_map[highest_rated.food_name] != highest_rated.food_rating:
            # Discard unmatched rating element from priority queue
            heapq.heappop(self.h[cuisine])
            highest_rated = self.h[cuisine][0]
        return highest_rated.food_name

# Your FoodRatings object will be instantiated and called as such:
# obj = FoodRatings(foods, cuisines, ratings)
# obj.changeRating(food,newRating)
# param_2 = obj.highestRated(cuisine)
```

```Python
class FoodRatings:

    def __init__(self, foods: List[str], cuisines: List[str], ratings: List[int]):
        self.h = collections.defaultdict(list)
        self.foods = foods
        self.cuisines = cuisines
        self.ratings = ratings

        for i, (f, c, r) in enumerate(zip(foods, cuisines, ratings)):
            heapq.heappush(self.h[c], (-r, f, i))

        self.memo = {f: i for i, f in enumerate(foods)}

    def changeRating(self, food: str, newRating: int) -> None:
        i = self.memo[food]
        self.ratings[i] = newRating
        cuisine = self.cuisines[i]
        heapq.heappush(self.h[cuisine], (-newRating, food, i))
        
    def highestRated(self, cuisine: str) -> str:
        # for pairs in self.guide[cuisine]:
        r, f, i = self.h[cuisine][0]
        while -r != self.ratings[i]:
            heapq.heappop(self.h[cuisine])
            r, f, i = self.h[cuisine][0]
        return f

# Your FoodRatings object will be instantiated and called as such:
# obj = FoodRatings(foods, cuisines, ratings)
# obj.changeRating(food,newRating)
# param_2 = obj.highestRated(cuisine)
```
