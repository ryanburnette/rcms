class Page < Post

  include RankedModel

  ranks :row_order

end