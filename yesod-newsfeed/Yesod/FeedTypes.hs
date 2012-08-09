module Yesod.FeedTypes
    ( Feed (..)
    , FeedEntry (..)
    , PodcastEnclosure (..)
    ) where

import Text.Hamlet      (Html)
import Data.Time.Clock  (UTCTime)
import Data.Text        (Text)

-- | The overall feed
data Feed url = Feed
    { feedTitle       :: Text
    , feedLinkSelf    :: url
    , feedLinkHome    :: url
    , feedAuthor      :: Text


    -- | note: currently only used for Rss
    , feedDescription :: Html

    -- | note: currently only used for Rss, possible values: 
    --   <http://www.rssboard.org/rss-language-codes>
    , feedLanguage    :: Text

    , feedUpdated     :: UTCTime
    , feedEntries     :: [FeedEntry url]
    }

-- | Each feed entry
data FeedEntry url = FeedEntry
    { feedEntryLink      :: url
    , feedEntryUpdated   :: UTCTime
    , feedEntryTitle     :: Text
    , feedEntryContent   :: Html
    , feedEntryEnclosure :: PodcastEnclosure url
    }

-- | A podcast enclosure specifies an url to a file, the file's length in bytes
--   and its mime type
data PodcastEnclosure url = PodcastEnclosure
    { enclosureLink   :: url
    , enclosureLength :: Int
    , enclosureMime   :: Text
    }
