customValidator = {
    "age.days": {
        method: function (name, value) {
            return value >= 0;
        },
        errorMessage: "Age should be a pssitive value"
    },
    "Telephone Number": {
        method: function (name, value, personAttributeDetails) {
            return value && value.length> 6;
        },
        errorMessage: "Telephone Number should have minimum 6 digits"
    }
};
