@val external __dirname: string = "__dirname"
// TODO: Update types for this function
@module
external compareImages: (. string, string, 'a) => Js.Promise.t<'a> = "resemblejs/compareImages"

let getDiff = (img1, img2) => {
  let options = {
    "output": {
      "errorColor": {
        "red": 255,
        "green": 0,
        "blue": 255,
      },
      "errorType": "movement",
      "transparency": 0.3,
      "largeImageThreshold": 1200,
      "useCrossOrigin": false,
      "outputDiff": true,
    },
    "scaleToSameSize": true,
    "ignore": "antialiasing",
  }

  compareImages(. img1, img2, options)
}

let img1 = Node.Path.resolve(__dirname, "../assets/img-orig.jpg")
let img2 = Node.Path.resolve(__dirname, "../assets/img-modified.jpg")

getDiff(img1, img2)->Promise.then(data => data->Js.log2("data")->Promise.resolve)->ignore
