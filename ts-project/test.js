const today = moment();
const startOfWeek = today.clone().startOf("isoWeek");
const weekDays = Array.from({ length: 7 }, (_, i) =>
    startOfWeek.clone().add(i, "days").format("MM-DD")
);