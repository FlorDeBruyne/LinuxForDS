import pandas as pd
import numpy as np
import seaborn as sns 
import scipy.stats as stats
import matplotlib.pyplot as plt
import json

df = pd.read_csv("data-workflow/airbnb_data.csv")
df.set_index("id", inplace=True)

df_time = df[["timestamp"]]
# df.drop(["timestamp"], axis=1, inplace=True)

df["rating"].fillna(df["rating"].median(), inplace=True)

# dict_map = {False : 0, True : 1}
# df["isSuperhost"] = df["isSuperhost"].map(dict_map)

# Correlatie tussen Rating en Prijs van Airbnb

sns.regplot(data=df, x="rating", y= "price")
plt.title("Correlatie tussen Rating en Prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_rating_prijs.png")
plt.close()
cor_rating = np.corrcoef(df.rating, df.price)[0][1]

# Correlatie tussen reviewsCount en prijs van Airbnb

sns.regplot(data=df, x="reviewsCount", y= "price")
plt.title("Correlatie tussen reviewsCount en Prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_reviews_prijs.png")
plt.close()
cor_review = np.corrcoef(df.reviewsCount, df.price)[0][1]

# Correlatie tussen beds en prijs van Airbnb

sns.regplot(data=df, x="beds", y= "price")
plt.title("Correlatie tussen beds en prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_beds_prijs.png")
plt.close()
cor_beds = np.corrcoef(df.beds, df.price)[0][1]

# Correlatie tussen bathrooms en prijs van Airbnb

sns.regplot(data=df, x="bathrooms", y= "price")
plt.title("Correlatie tussen bathrooms en prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_bathrooms_prijs.png")
plt.close()
cor_bathrooms = np.corrcoef(df.bathrooms, df.price)[0][1]

# Correlatie tussen bedrooms en prijs van Airbnb

sns.regplot(data=df, x="bedrooms", y= "price")
plt.title("Correlatie tussen bedrooms en prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_bedrooms_prijs.png")
plt.close()
cor_bedrooms = np.corrcoef(df.bedrooms, df.price)[0][1]


# Correlatie tussen Superhost en prijs van Airbnb

sns.boxplot(data=df, x="isSuperhost", y="price")
plt.title("Correlatie tussen Superhost en Prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_superhost_prijs_boxplot.png")
plt.close()

sns.violinplot(data=df, x="isSuperhost", y="price")
plt.title("Correlatie tussen Superhost en Prijs van Airbnb")
plt.savefig("data-workflow/images/correlatie_superhost_prijs_violinplot.png")
plt.close()

# H0 : μ1−μ2=0 (price is the same in both groups)
# H1: μ1−μ2<0 (price is significantly higher in the superhost group compared to the none superhost group)

superhost_ttest = stats.ttest_ind(alternative='less',
    a=df.price[df.isSuperhost == False],
    b=df.price[df.isSuperhost == True], equal_var=False)

# The pvalue=1.1809826864455826e-08, is very small, we can concluded that superhost has an impact on the price of an Airbnb

analysis_values = {
    "rating_price": cor_rating,
    "review_price": cor_review,
    "beds_price": cor_beds,
    "bathrooms_price": cor_bathrooms,
    "bedrooms_price": cor_bedrooms,
    "superhost_price": superhost_ttest.pvalue
}

with open("data-workflow/analysis/analysis_values.json", "w") as json_file:
    json.dump(analysis_values, json_file)