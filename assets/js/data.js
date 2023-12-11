jQuery(function ($) {
  $(document).ready(function () {
    function getData(url) {
      return fetch(url).then(response => response.json());
    }

    function cloneDiv(dataArray) {
      console.log(dataArray);
      const sampleDiv = $('#sampleDiv');
      sampleDiv.hide();
      for (let i = 0; i < 100; i++) {
        const clonedDiv = sampleDiv.clone();
        const name = clonedDiv.find('#name');
        let nameText = dataArray[i].name;
        name.text(nameText);
        clonedDiv.show();
        $("#scrolling-column").append(clonedDiv);
      }
        $('#scrolling-column .element').css('width', '300px');
    }

    getData('https://emerson-fleming.github.io/testSeniorStuff/universities_worldwide_async.json')
      .then(function (dataArray) {
        cloneDiv(dataArray);
      });
  });
});