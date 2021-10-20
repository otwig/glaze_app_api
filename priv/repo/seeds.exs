alias GlazeApi.Repo
alias GlazeApi.Api.Glaze
alias GlazeApi.Api.Image
alias GlazeApi.Api.Ingredient

# /****************/
Repo.insert!(%Glaze{
  name: "Oxblood Red",
  temp: 10,
  atmosphere: "reduction",
  kind: "Oxblood",
  description:
    "a deep red that drips aggressively when thick. Gorgeous, breaks well over texture and highly glossy.",
  firing: "back of the kiln is best, second shelf from the bottom if you can get it.",
  misc:
    "this glaze doesn’t play well with others and should be applied medium, but on the thin side. Beware! Bisque tends to absorb it aggressively. Best to use a quick dip."
})

Repo.insert!(%Image{
  img_url:
    "https://s3.amazonaws.com/glazy.org/public/uploads/recipes/27/m_33027.5c92383aa41f9.jpg",
  glaze_id: 1
})

Repo.insert!(%Ingredient{name: "Silica", amount: 28.50, glaze_id: 1})
Repo.insert!(%Ingredient{name: "Frit 3134", amount: 25.50, glaze_id: 1})
Repo.insert!(%Ingredient{name: "Whiting", amount: 21.50, glaze_id: 1})
Repo.insert!(%Ingredient{name: "EPK", amount: 21.50, glaze_id: 1})
Repo.insert!(%Ingredient{name: "Neph Sy", amount: 3.00, glaze_id: 1})
Repo.insert!(%Ingredient{name: "Tin Oxide", amount: 6.00, glaze_id: 1})
Repo.insert!(%Ingredient{name: "Chrome Oxide", amount: 0.20, glaze_id: 1})

# /****************/
Repo.insert!(%Glaze{
  name: "Goopy Purple",
  temp: 10,
  atmosphere: "reduction",
  kind: "Purple",
  description: "a purple that can go very blue. crystals if you're lucky!",
  firing: "anywhere is fine. if you slow cool it will crystalize... best to use in the winter!",
  misc:
    "this glaze doesn’t play well with others and should be applied medium for crystals. this glaze doesn’t play well with others and should be applied medium amount. but leave lots of bare clay beneath to drip on"
})

Repo.insert!(%Image{
  img_url:
    "https://s3.amazonaws.com/glazy.org/public/uploads/recipes/34/m_116334.5ff8b634a3eb2.jpg",
  glaze_id: 2
})

Repo.insert!(%Ingredient{name: "Custer Feldspar", amount: 28.50, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Silica", amount: 25.50, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Whiting", amount: 21.50, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Gertsley Borate", amount: 21.50, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Strontium", amount: 3.00, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Zinc Oxide", amount: 6.00, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Titanium Diox", amount: 0.20, glaze_id: 2})
Repo.insert!(%Ingredient{name: "EPK", amount: 2.83, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Tin Oxide", amount: 3.20, glaze_id: 2})
Repo.insert!(%Ingredient{name: "Copper Carb", amount: 1.10, glaze_id: 2})

# /****************/
Repo.insert!(%Glaze{
  name: "Chun for Copper",
  temp: 10,
  atmosphere: "reduction",
  kind: "Chun",
  description: "a thick glossy blue that can be used as a celadon if you're in a bind.",
  firing:
    "anywhere in the middle to bottom of the kiln is best for plain.. middle to high for overla[s.",
  misc:
    "literally perfect for any glaze with copper in it. you can get soft pinks if beneath, and glossy greens with crystals if applied on top. sprinkle copper (but seriously not much) if you want bacteria effect"
})

Repo.insert!(%Image{
  img_url:
    "https://s3.amazonaws.com/glazy.org/public/uploads/recipes/55/m_41755.5d37736b25062.jpg",
  glaze_id: 3
})

Repo.insert!(%Ingredient{name: "Minspar 200", amount: 28.50, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Silica", amount: 25.50, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Frit 3134", amount: 21.50, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Whiting", amount: 21.50, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Dolomite", amount: 3.00, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Zinc Oxide", amount: 6.00, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Bentonite", amount: 0.20, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Epsom Salts", amount: 1.00, glaze_id: 3})
Repo.insert!(%Ingredient{name: "Red Iron Oxide", amount: 1.00, glaze_id: 3})

# /****************/
Repo.insert!(%Glaze{
  name: "Fish Guts",
  temp: 10,
  atmosphere: "reduction",
  kind: "Flambe",
  description: "gooey beautiful purple/blue glory",
  firing: "back of the kiln is best, bottom shelf for maximum GOO!",
  misc:
    "plays well with chun and celadon but keep away from overlaps with reds. and should be applied medium to thick! don't forget to put it on EVERYTHING~"
})

Repo.insert!(%Image{
  img_url:
    "https://s3.amazonaws.com/glazy.org/public/uploads/recipes/35/m_11435.59da5ea721fa1.jpg",
  glaze_id: 4
})

Repo.insert!(%Ingredient{name: "Custer Feldspar", amount: 28.50, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Silica", amount: 25.50, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Gertsley Borate", amount: 21.50, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Whiting", amount: 21.50, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Dolomite", amount: 3.00, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Zinc Oxide", amount: 6.00, glaze_id: 4})
Repo.insert!(%Ingredient{name: "EPK", amount: 0.20, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Bentonite", amount: 0.20, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Copper Carbonate", amount: 1.00, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Tin Oxide", amount: 1.00, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Cobalt Carbonate", amount: 0.20, glaze_id: 4})
Repo.insert!(%Ingredient{name: "Rutile", amount: 1.00, glaze_id: 4})
