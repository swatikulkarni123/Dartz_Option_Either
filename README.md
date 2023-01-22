<html>
    <body>
            <h3>Dartz -> Option and Either </h3>
            <h4>
                Dartz : Dartz provide many function . Here we use Option and Either to make a api call. 
            </h4>
            <h3>Here we used BaseController and BaseView to handle all common functionality </h3>
            <h4>
                Option : 
            </h4>
            <h5> 
                Option can have two value Option&lt;T&gt;<br>
                1. none - means data is processing or api call is in progress<br>
                2. T - T can be int , string, or any data. In our case T is a Either&lt;ApiFailure,List&lt;dynamic&gt;&gt;<br>
                     - When an API call is completed, we receive a value, which can be success or failure.
                <br>
                To use value inside Option Variable we need to use fold method. <br>
                The fold method force us to use above both conditions.<br>
                we assign a value to Option using some(T)
            </h5>
            <br>
            <h5> 
                Either&lt;L,R&gt; - Either can have two value L and R. in our case: <br>
                1. L = ApiFailure<br>
                2. R = List&lt;dynamic&gt;
                <br>
                To use value inside Either Variable we need to use fold method.<br>
            </h5><br>
            EX: <br>
                Option&lt;Either&lt;ApiFailure, List&lt;dynamic&gt;&gt; apiResponse = none();
                assign value -> apiResponse = some(left(ApiFailure)) or <br>apiResponse = some(right(List&lt;dynamic&gt;))
                apiResponse.fold(
                    () {
                      if api call is in progress
                    },<br>
                    (eitherValue) => a.fold(<br>
                              (apiFailure) => handle Api error,<br>
                              (success) => handle Api success,<br>
                            ),
                );
            <p>
           </p>
    </body>
</html>
