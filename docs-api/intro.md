---
sidebar_position: 1
---

# API

### `load`

Loads the current edition of the map from the saved data file.

```js
DejaVu.load()
```

### `save`

Saves the current edition of the map in the map folder.

```js
DejaVu.save()
```

### `SetLayout`

Saves every layout for all subcategories 

```js
Dejavu.setLayout()
```

Saves all layouts of the given subcategory.

```js
Dejavu.setLayout(subcategory: string)
```

Saves the specific layout for a given subcategory.

```js
Dejavu.setLayout(subcategory: string, id, number)
```

