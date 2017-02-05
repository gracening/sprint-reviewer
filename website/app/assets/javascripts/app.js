var app = angular.module("reviewer", []);

app.service('dataService', function($http) {
    this.getGoodData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/goods'
        });
        $log.debug("get complete");
    }

    this.getBadData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/bads'
        });
        $log.debug("get complete");
    }

    this.getImproveData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/improves'
        });
        $log.debug("get complete");
    }
});

app.controller("Ctrl", ["$scope", "$q", "$log", "dataService", function($scope, $q, $log, dataService) {
    $log.debug("Initializing Controller");

    $scope.good = [];
    $scope.bad = [];
    $scope.improve = [];

    //$scope.data = null;

    // var DBNAME = "development";
    // var db = openDatabase(DBNAME, '1.0', 'ay lmao', 2 * 1024 * 1024);

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

    // function importData() {

    // }

    dataService.getGoodData().then(function(res) {
        $log.debug(res.data.length);
        for (var i = 0; i < res.data.length; i++) {
            $scope.good.push({
                id: res.data[i].id,
                body: res.data[i].body,
                author: res.data[i].author,
                date: res.data[i].date
            });
        }
        $log.debug("Successfully retrieved good data");
    });

    dataService.getBadData().then(function(res) {
        $log.debug(res.data.length);
        for (var i = 0; i < res.data.length; i++) {
            $scope.bad.push({
                id: res.data[i].id,
                body: res.data[i].body,
                author: res.data[i].author,
                date: res.data[i].date
            });
        }
        $log.debug("Successfully retrieved bad data");
    });

    dataService.getImproveData().then(function(res) {
        $log.debug(res.data.length);
        for (var i = 0; i < res.data.length; i++) {
            $scope.improve.push({
                id: res.data[i].id,
                body: res.data[i].body,
                author: res.data[i].author,
                date: res.data[i].date
            });
        }
        $log.debug("Successfully retrieved improve data");
    });

    //testSetUp();
    $log.debug("set up test data");
}]);

