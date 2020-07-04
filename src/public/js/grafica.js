am4core.useTheme(am4themes_animated);

var data = {
    "A1": { "2:00-3:00pm": 100, "3:00-4:00pm": 400, "4:00-5:00pm": 500, "5:00-6:00pm": 100, "5:00-7:00pm": 800, "7:00-8:00pm": 200,"8:00-9:00pm": 900,"9:00-10:00pm": 500,"10:00-11:00pm": 100 },
    "A2": { "2:00-3:00pm": 000, "3:00-4:00pm": 000, "4:00-5:00pm": 900, "5:00-6:00pm": 100, "5:00-7:00pm": 1800, "7:00-8:00pm": 200,"8:00-9:00pm": 900,"9:00-10:00pm": 500,"10:00-11:00pm": 200 },
    "A3": { "2:00-3:00pm": 500, "3:00-4:00pm": 100, "4:00-5:00pm": 900, "5:00-6:00pm": 200, "5:00-7:00pm": 800, "7:00-8:00pm": 200,"8:00-9:00pm": 900,"9:00-10:00pm": 500,"10:00-11:00pm": 100 }
  }

function processData(data) {
	var treeData = [];

	var smallBrands = { name: "Other", children: [] };

	for (var brand in data) {
		var brandData = { name: brand, children: [] }
		var brandTotal = 0;
		for (var model in data[brand]) {
			brandTotal += data[brand][model];
		}

		for (var model in data[brand]) {
			// do not add very small
			if (data[brand][model] > 100) {
				brandData.children.push({ name: model, count: data[brand][model] });
			}
		}

		// add to small brands if total number less than
		if (brandTotal > 4000) {
			treeData.push(brandData);
		}
		else {
			smallBrands.children.push(brandData)
		}

	}
	treeData.push(smallBrands);
	return treeData;
}

// create chart
var chart = am4core.create("chartdiv", am4charts.TreeMap);


// only one level visible initially
chart.maxLevels = 1;
// define data fields
chart.dataFields.value = "count";
chart.dataFields.name = "name";
chart.dataFields.children = "children";
chart.homeText = "US Car Sales 2017";

// enable navigation
chart.navigationBar = new am4charts.NavigationBar();

// level 0 series template
var level0SeriesTemplate = chart.seriesTemplates.create("0");
level0SeriesTemplate.strokeWidth = 2;

// by default only current level series bullets are visible, but as we need brand bullets to be visible all the time, we modify it's hidden state
level0SeriesTemplate.bulletsContainer.hiddenState.properties.opacity = 1;
level0SeriesTemplate.bulletsContainer.hiddenState.properties.visible = true;
// create hover state
var columnTemplate = level0SeriesTemplate.columns.template;
var hoverState = columnTemplate.states.create("hover");

// darken
hoverState.adapter.add("fill", function (fill, target) {
	if (fill instanceof am4core.Color) {
		return am4core.color(am4core.colors.brighten(fill.rgb, -0.2));
	}
	return fill;
})

// add logo
var image = columnTemplate.createChild(am4core.Image);
image.opacity = 0.15;
image.align = "center";
image.valign = "middle";
image.width = am4core.percent(80);
image.height = am4core.percent(80);

// add adapter for href to load correct image
image.adapter.add("href", function (href, target) {
	var dataItem = target.parent.dataItem;
	if (dataItem) {
		return "/logos/" + dataItem.treeMapDataItem.name.toLowerCase() + ".png";
	}
});

// level1 series template
var level1SeriesTemplate = chart.seriesTemplates.create("1");
level1SeriesTemplate.columns.template.fillOpacity = 0;

var bullet1 = level1SeriesTemplate.bullets.push(new am4charts.LabelBullet());
bullet1.locationX = 0.5;
bullet1.locationY = 0.5;
bullet1.label.text = "{name}";
bullet1.label.fill = am4core.color("#ffffff");

// level2 series template
var level2SeriesTemplate = chart.seriesTemplates.create("2");
level2SeriesTemplate.columns.template.fillOpacity = 0;

var bullet2 = level2SeriesTemplate.bullets.push(new am4charts.LabelBullet());
bullet2.locationX = 0.5;
bullet2.locationY = 0.5;
bullet2.label.text = "{name}";
bullet2.label.fill = am4core.color("#ffffff");

chart.data = processData(data);