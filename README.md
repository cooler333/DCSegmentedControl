# DCSegmentedControl

## UISegmentedControl + auto-shrink(autoresizable) title

#### UISegmentedControl with custom method
<p align="left" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCSegmentedControl/iOS%20Simulator%20Screen%20shot%2019.06.2013%2C%2015.01.12.png" alt="AFNetworking" title="AFNetworking">
</p>

#### UISegmentedControl without custom method
<p align="left" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCSegmentedControl/iOS%20Simulator%20Screen%20shot%2019.06.2013%2C%2015.01.19.png" alt="AFNetworking" title="AFNetworking">
</p>

## Reference

### Custom method:
```objective-c
- (void)resizeTitleTextFontToFit;
```

## Example Usage

```objective-c
UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0f]; // Font with max size
NSDictionary *textAttributes = @{UITextAttributeFont : font};
[_segmentedControl setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
[_segmentedControl removeAllSegments];
    
NSString *veryLongString = @"very long text";

for (NSInteger i = 0; i < segmentCount; i ++) {
    [_segmentedControl insertSegmentWithTitle:veryLongString atIndex:i animated:NO];
}
    
[_segmentedControl resizeTitleTextFontToFit];
```