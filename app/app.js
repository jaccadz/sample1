
var app = angular.module('columbiaApp', ['ngRoute', 'ui-notification']);

function SearchCtrl($scope, $http) {
	//$scope.url = 'services/search.php'; 
	var serviceBase = 'services/'
	//window.alert("OLA");
	
	$scope.search = function() {
		
		var flag=1;
		$http.post(serviceBase + 'searchJO', { "data" : $scope.keywords, "lname" : $scope.lname}).
		success(function(data, status) {
			$scope.status = status;
			$scope.data = data;
			$scope.searchJOresult = data; 
			
			window.alert($scope.searchJOresult.jo_no.tostring );
			if (searchJOresult.jo_no != "No record found.") {
				flag=1;
			}
		})
		.
		error(function(data, status) {
			$scope.data = data || "Request failed";
			$scope.status = status;		
			//$scope.searchJOresult = data; 			
		});
		
		
		if (flag==1) {
			$http.post(serviceBase + 'joDetails', { "data" : $scope.keywords}).
			success(function(data, status) {
				$scope.status = status;
				$scope.data = data;
				$scope.joDetailsResult = data; 
			})
			.
			error(function(data, status) {
				$scope.data = data || "Request failed";
				$scope.status = status;		
				$scope.joDetailsResult = data; 			
			});
			
			$http.post(serviceBase + 'joServiceReport', { "data" : $scope.keywords}).
			success(function(data, status) {
				$scope.status = status;
				$scope.data = data;
				$scope.joServiceReportResult = data; 
			})
			.
			error(function(data, status) {
				$scope.data = data || "Request failed";
				$scope.status = status;		
				$scope.joServiceReportResult = data; 			
			});
			
			$http.post(serviceBase + 'srTotals', { "data" : $scope.keywords}).
			success(function(data, status) {
				$scope.status = status;
				$scope.data = data;
				$scope.srTotals = data; 
			})
			.
			error(function(data, status) {
				$scope.data = data || "Request failed";
				$scope.status = status;		
				$scope.srTotals = data; 			
			});
			
		}
		
		
	};
}


app.config(['$routeProvider',
  function($routeProvider, $locationProvider) {
    $routeProvider.
      when('/', {
        title: 'Users',
        templateUrl: 'partials/inquire.html',
        controller: 'editCtrl'
      })
      .when('/inquire/:JOID', {
        title: 'Edit Users',
        templateUrl: 'partials/inquire.html',
        controller: 'editCtrl',
        resolve: {
          order: function(services, $route){
            var JOID = $route.current.params.JOID;
            return services.getJO(JOID);
          }
        }
      })
        

      .otherwise({
        redirectTo: '/'
      });

}]);


app.run(['$location', '$rootScope', function($location, $rootScope) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.$$route.title;
    });
}]);




















