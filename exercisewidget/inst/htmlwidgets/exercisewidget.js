HTMLWidgets.widget({
  name: "exercisewidget",

  type: "output",

  factory: function (el, width, height) {
    return {
      renderValue: function (opts) {
        el.style.backgroundColor = "limegreen";
        el.style.padding = "8px";

        const h3 = document.createElement("h3");
        h3.innerText = `Exercise: ${opts.task}`;
        h3.style["font-family"] = "Arial, Helvetica, sans-serif";
        h3.style.margin = "0 0 8px";

        const p = document.createElement("p");
        p.innerText = opts.instructions;
        p.style.margin = "0";

        el.appendChild(h3);
        el.appendChild(p);
      },

      resize: function (width, height) {},
    };
  },
});
