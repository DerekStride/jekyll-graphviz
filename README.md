# Jekyll::Graphviz

A GraphViz converter for Jekyll.

## Installation

Add this line to your site's Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-graphviz-dot"
end
```

And then add this line to your site's `_config.yml`:

```yml
plugins:
  - jekyll-feed
```

## Usage

In your Jekyll site, create a GraphViz files that start with the following lines:

```
---
---
```


You need those three dashes in order for Jekyll to recognize it as "convertible". They won't be included in the content
passed to the GraphViz parser.

Below is an example file that generate the following image:

```dot
---
---

digraph X {
  a -> b
}
```

![foo](https://user-images.githubusercontent.com/6456191/126874946-81e25b07-fceb-45eb-bef1-5a1d3e79fe37.jpg)

By default the images will be outputted as an `svg` to change to another [compatible
type](https://github.com/glejeune/Ruby-Graphviz/blob/c3be805fc5e62ea1326eb9bb3708a807d1178525/lib/graphviz/constants.rb#L47-L92)
use the `graphviz.format` option in your site's `_config.yml`.

```yml
graphviz:
  format: jpg
```

### GraphViz

This plugin depends on [ruby-graphviz](https://github.com/glejeune/Ruby-Graphviz) which requires the GraphViz command
line tool to be installed locally. You can find [Installation Instructions Here](https://graphviz.org/download/).

### Github Pages

To use this plugin with Github pages you'll need to use
[limjh16/jekyll-action-ts](https://github.com/limjh16/jekyll-action-ts) to setup a custom Github Pages deploy pipeline
and install GraphViz with [ts-graphviz/setup-graphviz](https://github.com/ts-graphviz/setup-graphviz). Check out this
repo's [Github Actions
Workflow](https://github.com/DerekStride/jekyll-graphviz/blob/main/.github/workflows/gh-pages.yml) for an example.

There is an example jekyll site in the [`docs/`](https://github.com/DerekStride/jekyll-graphviz/tree/main/docs) folder
of this repo.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests.

