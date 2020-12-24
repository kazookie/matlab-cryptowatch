classdef markets
    properties
        end_point = 'https://api.cryptowat.ch/markets';
    end
    
    methods (Access = private)        
        function response = get_query(this, path, query)
            if nargin == 3
                    request = char(matlab.net.QueryParameter(query));
                    path = [path, '?', request];
            end
            response = webread(path);
        end
    end

    methods
        function list = get_list(this)
            path = '';
            list = this.get_query([this.end_point, path]);
        end
        
        function details = get_details(this, exchange, pair)
            path = ['/', exchange, '/', pair];
            details = this.get_query([this.end_point, path]);
        end
        
        function price = get_price(this, exchange, pair)
            path = ['/', exchange, '/', pair, '/price'];
            price = this.get_query([this.end_point, path]);
        end
        
        function prices = get_prices(this)
            path = '/prices';
            prices = this.get_query([this.end_point, path]);
        end
        
        function trandes = get_trandes(this, exchange, pair, query)
            path = ['/', exchange, '/', pair, '/trades'];
            trandes = this.get_query([this.end_point, path], query);
        end
        
        function summary = get_summary(this, exchange, pair)
            path = ['/', exchange, '/', pair, '/summary'];
            summary = this.get_query([this.end_point, path]);
        end
        
        function summaries = get_summaries(this, query)
            path = '/summaries';
            summaries = this.get_query([this.end_point, path], query);
        end
        
        function ohlc = get_ohlc(this, exchange, pair, query)
            path = ['/', exchange, '/', pair, '/ohlc'];
            ohlc = this.get_query([this.end_point, path], query);
        end
    end
end