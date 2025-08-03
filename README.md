# project_walmart: SQL + Python

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Jupter Notebook, Python, SQL (MySQL)

### 2. Download Walmart Sales Data
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)

### 3. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 4. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 5. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 6. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 7. SQL Analysis: Walmart Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     1. Analyze Payment Methods and Sales
        - Question: What are the different payment methods, and how many transactions and items were sold with each method?
        - Purpose: This helps understand customer preferences for payment methods, aiding in payment optimization strategies.
        
     2. Identify the Highest-Rated Category in Each Branch
        - Question: Which category received the highest average rating in each branch?
        - Purpose: This allows Walmart to recognize and promote popular categories in specific branches, enhancing customer satisfaction and branch-specific marketing.
        
     3. Determine the Busiest Day for Each Branch
        - Question: What is the busiest day of the week for each branch based on transaction volume?
        - Purpose: This insight helps in optimizing staffing and inventory management to accommodate peak days.
        
     4. Calculate Total Quantity Sold by Payment Method
        - Question: How many items were sold through each payment method?
        - Purpose: This helps Walmart track sales volume by payment type, providing insights into customer purchasing habits.
        
     5. Analyze Category Ratings by City
        - Question: What are the average, minimum, and maximum ratings for each category in each city
        - Purpose: This data can guide city-level promotions, allowing Walmart to address regional preferences and improve customer experiences.
        
     6. Calculate Total Profit by Category
        - Question: What is the total profit for each category, ranked from highest to lowest?
        - Purpose: Identifying high-profit categories helps focus efforts on expanding these products or managing pricing strategies effectively.
        
     7. Determine the Most Common Payment Method per Branch
        - Question: What is the most frequently used payment method in each branch?
        - Purpose: This information aids in understanding branch-specific payment preferences, potentially allowing branches to streamline their payment processing systems.
        
     8. Analyze Sales Shifts Throughout the Day
        - Question: How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?
        - Purpose: This insight helps in managing staff shifts and stock replenishment schedules, especially during high-sales periods.
        
     9. Identify Branches with Highest Revenue Decline Year-Over-Year (eg. 2022-2023)
        - Question: Which branches experienced the largest decrease in revenue compared to the previous year?
        - Purpose: Detecting branches with declining revenue is crucial for understanding possible local issues and creating strategies to boost sales or mitigate losses.
    
### 8. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks (if applicable).
     - SQL query scripts.
     - Data files (if possible) or steps to access them.
