const getStartDate = () => {
  let startYear = document.getElementById("order_start_date_1i");
  startYear = startYear.options[startYear.selectedIndex].text;
  let startMonth = document.getElementById("order_start_date_2i");
  startMonth = startMonth.options[startMonth.selectedIndex].text;
  let startDay = document.getElementById("order_start_date_3i");
  startDay = startDay.options[startDay.selectedIndex].text;
  let startDate = new Date(`${startMonth} ${startDay}, ${startYear} 23:59:59`);
  return startDate
};

const getEndDate = () => {
  let endYear = document.getElementById("order_end_date_1i");
  endYear = endYear.options[endYear.selectedIndex].text;
  let endMonth = document.getElementById("order_end_date_2i");
  endMonth = endMonth.options[endMonth.selectedIndex].text;
  let endDay = document.getElementById("order_end_date_3i");
  endDay = endDay.options[endDay.selectedIndex].text;
  let endDate = new Date(`${endMonth} ${endDay}, ${endYear} 23:59:59`);
  return endDate;
};

const startDateInPast = (message) => {
  const errorMessage = document.getElementById("start-date-tag");
  errorMessage.style.color = "red"
  errorMessage.innerHTML = message
  const validMessage = document.getElementById("end-date-tag");
  validMessage.style.color = "red"
};

const getDateDifference = () => {
    const startDate = getStartDate();
    const endDate = getEndDate();
    let duration = 0;
    if (startDate && endDate) {
      duration = ((endDate - startDate) / (1000 * 60 * 60 * 24)) + 1
      const errorMessage = document.getElementById("start-date-tag");
      errorMessage.style.color = "transparent";
      errorMessage.innerHTML = "Empty";
      const validMessage = document.getElementById("end-date-tag");
      validMessage.style.color = "transparent";
      const totalDisplay = document.getElementById("total");
      totalDisplay.style.color = "rgba(255, 255, 255, 1)"
      totalDisplay.style.borderColor = "rgba(255, 255, 255, 0.6)"
      if (startDate <= Date.now()) {
        startDateInPast("*Start date cannot be in the past!");
        return 0
      } else if (startDate > endDate) {
        startDateInPast("*Start date cannot be later than the end date!");
        return 0
      } else {
        return duration;
      };
    };
};

const calculatePrice = () => {
  document.addEventListener("change", (_event) => {
    const duration = getDateDifference();
    console.log(duration);
    let total = 0
    const dailyPrice = document.getElementById("order_amount")
    const totalDisplay = document.getElementById("total");
    if (duration === 0) {
      total = 0
      totalDisplay.innerHTML = `Total : ${total} CHF`
      totalDisplay.style.color = 'red'
      totalDisplay.style.borderColor = "red"
    } else {
      total = dailyPrice.value * duration;
      totalDisplay.innerHTML = `Total : ${total} CHF`
    }
  });
};


export { calculatePrice };

