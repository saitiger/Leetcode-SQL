select tweet_id
from
Tweets
where 
char_length(content)>15
