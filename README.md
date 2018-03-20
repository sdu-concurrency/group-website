# The PLS Research Group Website

## Guidelines for website content management

### Writing static pages

Static pages are in the root folder as markdown (`.md`) files. Unless some html
tags are needed, you can directly edit the content using the markdown syntax.
In case you need to add html elements and still want to write content inside of them in markdown, just remember to add the `markdown="1"` attribute to the 
HTML tag.

### Writing event posts

Event posts are found in `_posts` folder within the root. There, a post is a separate `.md` file named following the convention `dd-mm-yyyy-title.md`. The `title` is not important and the only constraint is that the first part of the name corresponds to a date formatted follow the previous rule.

The header of each file follows the convention below, which is self-explanatory. In the main part of the post, please use the tag `<!--more-->` to set the limit of the post excerpt, used to preview the article.

```yaml
---
layout: post
title:  "My Fancy Title"
date:   2018-03-10 14:00:00
permalink: /first-post.html
---
```

### Adding publications

Publications are added inside the `_data/papers` folder, within the root, in files named by year. E.g., file `2017.json` is a json array `[ { object_1 }, { object_2 }, ... ]` that contains papers published in 2017. The schema for each `object` is

```json
{
    "bibitem": "BIB_CONTENT",
    "pdf": [
      { 
        "link" : "PAPERLINK", 
        "name" : "PAPERLINK_NAME" 
      }, 
      {
        "link" : "PAPERLINK"
      }
    ],
    "tags" : [ "TAG1", "TAG2", "TAG3" ],
    "authors" : [ "MEMBER1" , "MEMBER2" ],
    "grants" : [ "G1" , "G2" ],
    "non_group" : FALSE
}
```

Where 

- `BIBLINK` is the bibitem of the paper in linearised format (no new lines);
- `"pdf"` contains a list of links to pdfs related to the publication. For each element, if the `"name"` attribute of the element is omitted, it will be visualised using the default name `paper`;
- `"tags"` contains relevant tags/keywords for the paper, used by the by-keyword filter to select the related papers;
- `"authors"` contains relevant the members in the PLS group that authored the paper. These are used by the by-author filter to select the related papers;
- `"grants"` contains possible grants that supported the publication;
- `"non_group"` is a flag (hence its related content is irrelevant) to mark the paper as not published by the group.

### Adding peoples

People entries are stored inside the `_data/people` folder, within the root, in json files. The name does not matter. Each person follows the schema

```json
{
  "name" : "NAME",
  "role" : "ROLE",
  "dblp" : "LINK",
  "google_scholar" : "LINK",
  "orcid" : "LINK",
  "website" : "LINK",
  "github" : "LINK",
  "bio" : "A SHORT BIO",
  "photo" : "LINK",
  "research_topics" : [ "TOPIC1", "TOPIC2" ]
}
```

People images can be included in the folder `images/people` under the root. To link the image in the json entry use the path from the root to the file, e.g, `/images/people/PHOTO.jpg`.

### Adding grants

Grant entries are stored inside the `_data` folder, within the root, in a json file named `grants.json`. Each grant in the file follows the schema

```json
{
  "title" : "NAME",
  "id" : "NAME",
  "participants" : [ 
    { 
      "name" : "NAME",
      "role" : "ROLE",
      "affiliation" : "AFF" 
    }
  ],
  "website" : "LINK",
  "number" : "STRING",
  "period" : { "start": "STRING", "end": "STRING" },
  "foundation" : "STRING",
  "amount" : "STRING"
}
```
The fields above should be self-explanatory. `"id"` is used to add an `id` attribute in the grants page to link directly a specific grant from other pages.