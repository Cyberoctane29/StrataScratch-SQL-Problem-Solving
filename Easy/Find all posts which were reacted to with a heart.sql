-- Problem 10087: Find all posts which were reacted to with a heart
-- Difficulty: Easy

-- Table: facebook_reactions
-- +----------+---------+
-- | Column   | Type    |
-- +----------+---------+
-- | poster   | bigint  |
-- | friend   | bigint  |
-- | reaction | text    |
-- | date_day | int     |
-- | post_id  | bigint  |
-- +----------+---------+
-- Each row represents a reaction to a Facebook post.

-- Table: facebook_posts
-- +---------------+--------+
-- | Column Name   | Type   |
-- +---------------+--------+
-- | post_id       | bigint |
-- | poster        | bigint |
-- | post_text     | text   |
-- | post_keywords | text   |
-- | post_date     | date   |
-- +---------------+--------+
-- Each row contains information about a Facebook post.

-- Problem Statement:
-- Find all posts that received a 'heart' reaction.
-- Return all columns from the facebook_posts table.
-- Ensure that each post appears only once in the result.

-- Solution:

SELECT DISTINCT
    f2.*
FROM facebook_reactions AS f1
INNER JOIN facebook_posts AS f2
    ON f1.post_id = f2.post_id
WHERE f1.reaction = 'heart';

-- Intuition:
-- Identify reactions of type 'heart', then retrieve the corresponding
-- posts. Use DISTINCT to prevent duplicate posts when multiple
-- heart reactions exist for the same post.

-- Explanation:
-- - INNER JOIN: Match reactions with their corresponding posts
--   using post_id.
-- - WHERE: Keep only rows where the reaction is 'heart'.
-- - DISTINCT: Return each post only once, even if it received
--   multiple heart reactions.
-- - SELECT f2.*: Return all columns from facebook_posts.