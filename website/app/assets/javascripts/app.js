var app = angular.module("reviewer", []);

app.service('dataService', function($http) {
    this.getTableData = function() {
        return $http({
            method: 'GET',
            url: 'http://localhost:3000/tables'
        });
    }

    this.addTableData = function(column_name, author, sprint, body, team) {
        return $http({
            method: 'POST',
            url: 'http://localhost:3000/tables',
            data: {
                'column_name': column_name,
                'author': author,
                'sprint': sprint,
                'body': body,
                'team': team
            }
        });
    }

    // this.deleteGood = function(id) {
    //     return $http({
    //         method: 'DELETE',
    //         url: 'http://localhost:3000/improves',
    //         data: {
    //             'id': id,
    //             'body': entry,
    //             'author': author,
    //             'date': date
    //         }
    //     });
    // }
});

app.controller("Ctrl", ["$scope", "$q", "$log", "$http", "dataService", function($scope, $q, $log, $http, dataService) {
    $log.debug("Initializing Controller");

    $scope.table = [];

    //GET
    dataService.getTableData().then(function(res) {
        for (var i = 0; i < res.data.length; i++) {
            $scope.table.push({ 
                column_name: res.data[i].column_name,
                author: res.data[i].author,
                sprint: res.data[i].sprint,
                body: res.data[i].body,
                team: res.data[i].team
            });
        }
        $log.debug("Successfully retrieved table data");
    });

    //POST
    $scope.addTable = function(body) {
        $log.debug($scope.table.length+1);
        dataService.addTableData(1, "ali", "bruh", body, "blue").then(function(res) {
            $scope.table.push({
                column_name: '1',
                author: "emily",
                sprint: "yup",
                body: body,
                team: "blue"
            });
            $scope.goodInput = "";
        });
    };

    $scope.deleteGood = function(userId){
        $log.debug(userId);
        $http.delete('/goods/' + userId);
    };
    
    //will take index
    // $scope.aylmao = function() {
    //     $http.delete('/goods', ).then(function(res) {

    //     });
    // }

}]);

