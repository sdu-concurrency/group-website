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

Publications are added inside the `_data` folder, within the root, in files named with the prefix `papers_` and a year. E.g., file `papers_2017.json` is a json array `[ { object_1 }, { object_2 }, ... ]` that contains papers published in 2017. The schema for each `object` is

```json
{
    "content": "TITLE",
    "bibitem": "BIBLINK",
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
    "authors" : [ "MEMBER1" , "MEMBER2" ]
}
```

Where 

- `TITLE` is the paper reference in some extended form, e.g., MLA, APA, etc.;
- `BIBLINK` is the link to the bibitem (dblp, google scholar, self-hosted);
- `"pdf"` contains a list of links to pdfs related to the publication. For each element, if the `"name"` attribute of the element is omitted, it will be visualised using the default name `paper`;
- `"tags"` contains relevant tags/keywords for the paper, used by the by-keyword filter to select the related papers;
- `"authors"` contains relevant the members in the PLS group that authored the paper. These are used by the by-author filter to select the related papers.

### Adding peoples

People entries are also stored inside the `_data` folder, within the root, in json files named with the prefix `people_` followed by a name. The name is just a mnemonic handler and not visualised in the website. Each person follows the schema

```json
{
  "name" : "NAME",
  "role" : "ROLE",
  "dblp_link" : "DBLP_LINK",
  "website" : "WEBSITE_LINK",
  "bio" : "A SHORT BIO",
  "photo" : "PHOTO_LINK"
}
```

People images can be included in the folder `images/people` under the root. To link the image in the json entry use the path from the root to the file, e.g, `/images/people/PHOTO.jpg`.

