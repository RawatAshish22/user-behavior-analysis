-- ============================================
-- USER BEHAVIOR & RETENTION ANALYSIS
-- ============================================

-- 1. TOTAL USERS
SELECT COUNT(DISTINCT user_id) AS total_users
FROM users;

-- ============================================

-- 2. ACTIVE vs INACTIVE USERS
SELECT 
  CASE 
    WHEN Last_Login_Days_Ago <= 7 THEN 'Active'
    ELSE 'Inactive'
  END AS user_status,
  COUNT(*) AS total_users
FROM users
GROUP BY user_status;

-- ============================================

-- 3. HIGH VALUE vs LOW VALUE USERS
SELECT 
  CASE 
    WHEN Total_Spending > 10000 THEN 'High Value'
    ELSE 'Low Value'
  END AS user_value,
  COUNT(*) AS total_users
FROM users
GROUP BY user_value;

-- ============================================

-- 4. ENGAGEMENT ANALYSIS
SELECT 
  CASE 
    WHEN Time_Spent_on_Site_Minutes > 30 THEN 'High Engagement'
    ELSE 'Low Engagement'
  END AS engagement_level,
  COUNT(*) AS total_users
FROM users
GROUP BY engagement_level;

-- ============================================

-- 5. TOTAL REVENUE
SELECT SUM(Total_Spending) AS total_revenue
FROM users;

-- ============================================

-- 6. AVERAGE SPENDING
SELECT AVG(Total_Spending) AS avg_spending
FROM users;

-- ============================================

-- 7. REVENUE BY PRODUCT CATEGORY
SELECT 
  Product_Category_Preference,
  SUM(Total_Spending) AS total_revenue
FROM users
GROUP BY Product_Category_Preference
ORDER BY total_revenue DESC;

-- ============================================

-- 8. ENGAGEMENT vs SPENDING
SELECT 
  CASE 
    WHEN Time_Spent_on_Site_Minutes > 30 THEN 'High Engagement'
    ELSE 'Low Engagement'
  END AS engagement_level,
  AVG(Total_Spending) AS avg_spending
FROM users
GROUP BY engagement_level;

-- ============================================

-- 9. USER ACTIVITY ANALYSIS
SELECT 
  AVG(Pages_Viewed) AS avg_pages_viewed,
  AVG(Time_Spent_on_Site_Minutes) AS avg_time_spent
FROM users;

-- ============================================

-- 10. CUSTOMER SEGMENTATION (ADVANCED 🔥)
SELECT 
  user_id,
  Total_Spending,
  Purchase_Frequency,
  CASE 
    WHEN Total_Spending > 10000 AND Purchase_Frequency > 20 THEN 'Premium'
    WHEN Total_Spending > 5000 THEN 'Regular'
    ELSE 'Low Value'
  END AS customer_segment
FROM users;

-- ============================================

-- 11. LOCATION-WISE USER DISTRIBUTION
SELECT 
  Location,
  COUNT(*) AS total_users
FROM users
GROUP BY Location;

-- ============================================

-- 12. GENDER-WISE SPENDING
SELECT 
  Gender,
  SUM(Total_Spending) AS total_spending
FROM users
GROUP BY Gender;

-- ============================================