const compareImages = require("resemblejs/compareImages");
const fs = require("fs");

async function getDiff() {
    const options = {
        output: {
            errorColor: {
                red: 255,
                green: 0,
                blue: 255,
            },
            errorType: "movement",
            transparency: 0.3,
            largeImageThreshold: 1200,
            useCrossOrigin: false,
            outputDiff: true,
        },
        scaleToSameSize: true,
        ignore: "antialiasing",
    };

    const data = await compareImages(
        await fs.promises.readFile("./assets/img-orig.jpg"),
        await fs.promises.readFile("./assets/img-modified.jpg"),
        options
    );

    console.log("data", data);

    await fs.promises.writeFile("./assets/output.png", data.getBuffer());
}

getDiff();
