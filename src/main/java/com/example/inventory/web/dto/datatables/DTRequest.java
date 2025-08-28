package com.example.inventory.web.dto.datatables;



import lombok.*;
import java.util.List;
import java.util.Map;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class DTRequest {
    private int draw;
    private int start;          // offset
    private int length;         // page size
    private DTSearch search;
    private List<DTOrder> order;
    private List<DTColumn> columns;

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor
    public static class DTSearch { private String value; private boolean regex; }

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor
    public static class DTOrder { private int column; private String dir; } // "asc"/"desc"

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor
    public static class DTColumn {
        private String data;      // sütun "data" ismi (frontend columns[].data)
        private String name;
        private boolean searchable;
        private boolean orderable;
        private DTSearch search;
    }
}



