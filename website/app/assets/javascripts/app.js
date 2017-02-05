var app = angular.module("reviewer", []);

app.controller("Ctrl", ["$scope", "$log", function($scope, $log) {
    $log.debug("Initializing Controller");

    $scope.good = [];
    $scope.bad = [];
    $scope.improve = [];

    function testSetUp() {
        for (var i = 0; i < 10; i++) {
            $scope.good.push({
                id: i,
                body: "suh dude",
                author: "ski",
                date: "yes"
            });
            $scope.bad.push({
                id: i,
                body: "suh dude",
                author: "ski",
                date: "yes"
            });
            $scope.improve.push({
                id: i,
                body: "suh dude",
                author: "ski",
                date: "yes"
            });
        }
    }

    testSetUp();
    $log.debug("set up test data");

}]);