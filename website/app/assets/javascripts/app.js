var app = angular.module("reviewer", []);

app.service('dataService', function($http) {
    this.getGoodData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/goods'
        });
    }

    this.getBadData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/bads'
        });
    }

    this.getImproveData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/improves'
        });
    }

    this.addGoodData = function(id, entry, author, date) {
        return $http({
            method: 'POST',
            url: 'http://localhost:3000/goods',
            data: {
                'id': id,
                'body': entry,
                'author': author,
                'date': date
            }
        });
    }

    this.addBadData = function(id, entry, author, date) {
        return $http({
            method: 'POST',
            url: 'http://localhost:3000/bads',
            data: {
                'id': id,
                'body': entry,
                'author': author,
                'date': date
            }
        });
    }

    this.addImproveData = function(id, entry, author, date) {
        return $http({
            method: 'POST',
            url: 'http://localhost:3000/improves',
            data: {
                'id': id,
                'body': entry,
                'author': author,
                'date': date
            }
        });
    }
});

app.controller("Ctrl", ["$scope", "$q", "$log", "$http", "dataService", function($scope, $q, $log, $http, dataService) {
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

    //testSetUp();
    //$log.debug("set up test data");

    //GET
    dataService.getGoodData().then(function(res) {
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

    //POST
    $scope.addGood = function(body) {
        $log.debug($scope.good.length+1);
        dataService.addGoodData($scope.good.length+1, body, "ay", "bruh").then(function(res) {
            $scope.good.push({
                id: $scope.good.length+1,
                body: body,
                author: "yup",
                date: "yup"
            });
        });
        $scope.goodInput = "";
    };
    
    $scope.addBad = function(body) {
        $log.debug("yes");
        $log.debug($scope.bad.length+1);
        dataService.addBadData($scope.bad.length+1, body, "ay", "bruh").then(function(res) {
            $scope.bad.push({
                id: $scope.bad.length+1,
                body: body,
                author: "yup",
                date: "yup"
            });
        });
    };

    $scope.addIm = function(body) {
        $log.debug($scope.improve.length+1);
        dataService.addImproveData($scope.improve.length+1, body, "ay", "bruh").then(function(res) {
            $scope.improve.push({
                id: $scope.improve.length+1,
                body: body,
                author: "yup",
                date: "yup"
            });
        });
    };

    //will take index
    // $scope.aylmao = function() {
    //     $http.delete('/goods', ).then(function(res) {

    //     });
    // }


}]);

