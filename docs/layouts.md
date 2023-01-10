---
sidebar_position: 3
---

# Layouts

Layouts serve as the **components** that we will use to mix and match to create a variety of unique templates.

---

## Creating a Layout


1. Create a folder under `Layouts` within the **Workspace**. The name of your folder should correspond to a family of similar assets, rather than a single asset.

    <Highlight color="#00A300">Good Naming:</Highlight> <br/>

        Tree
        Flower

    <Highlight color="#FF0000">Bad Naming:</Highlight> <br/>

        Oak
        Tulip

    :::danger Layout Naming

    Layout names must be unique!

    :::


2. Create a module script under `Templates` within the map's data folder in the **Workspace** with your chosen layout name.

3. Create a folder under `Assets` within the `Dejavu` folder in **Replicated Storage**. This is where your assets that correspond to that layout will be stored for Dejavu to retrieve.

---

## Configuration

Next, it's time to create different configurations for the layout we just created. For each configuration we make, we must use a ground asset as a reference. This can be a mesh or a part. 

Place the ground asset within the layout folder we just created, and name it numerically based on how many configurations are already present (1 if none, 2 if one already exists, etc).

Next, it's time to start designing. 
Position your assets in different ways for each configuration to add variety.

After configuration, your layouts folder should look like this for the example provided:

![Docusaurus logo](/img/layout-explorer.jpg)

![Docusaurus logo](/img/layout-assets.jpg)

Once we are complete, we have to save the layout we just created, as well as its configuration. To accomplish this, we can run the following code from the command line. (In my case, layoutName would be "Tree", as I created a tree layout)

```js
Dejavu.setLayout(layoutName: string)
```

Next, we'll learn how to display different layouts together to form a [Template](./templates.md)

export const Highlight = ({children, color}) => (
  <span
    style={{
      backgroundColor: color,
      borderRadius: '2px',
      color: '#fff',
      padding: '0.2rem',
    }}>
    {children}
  </span>
);