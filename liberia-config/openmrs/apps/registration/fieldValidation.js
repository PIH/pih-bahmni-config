customValidator = {
    "age.days": {
        method: function (name, value) {
            return value >= 0;
        },
        errorMessage: "Age should be a positive value"
    },
    "Telephone Number": {
        method: function (name, value, personAttributeDetails) {
            return value && value.length> 6;
        },
        errorMessage: "Telephone Number should have minimum 6 digits"
    },
    "First Name of Mother": {
        required: true
        }
};