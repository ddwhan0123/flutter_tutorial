package com.example.flutter_sample.view;

import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.animation.LinearInterpolator;

import java.util.ArrayList;

/**
 * @author tangpeng.yang.o
 * @data
 */
public class LoadingIndicator extends Indicator {

    float[] translateX = new float[2], translateY = new float[2];

    @Override
    public void draw(Canvas canvas, Paint paint) {
        for (int i = 0; i < 2; i++) {
            if (i == 0) {
                paint.setColor(Color.parseColor("#00bebe"));
            } else {
                paint.setColor(Color.parseColor("#00dada"));
            }
            canvas.save();
            canvas.translate(translateX[i], 20);
            canvas.drawCircle(0, 0, getWidth() / 10, paint);
            canvas.restore();
        }
    }

    @Override
    public ArrayList<ValueAnimator> onCreateAnimators() {
        ArrayList<ValueAnimator> animators = new ArrayList<>();
        float startX = getWidth() / 6;
        for (int i = 0; i < 2; i++) {
            final int index = i;
            ValueAnimator translateXAnim = ValueAnimator.ofFloat(startX, getWidth() - startX, startX);
            if (i == 1) {
                translateXAnim = ValueAnimator.ofFloat(getWidth() - startX, startX, getWidth() - startX);
            }

            translateXAnim.setDuration(1000);
            translateXAnim.setInterpolator(new LinearInterpolator());
            translateXAnim.setRepeatCount(-1);
            addUpdateListener(translateXAnim, new ValueAnimator.AnimatorUpdateListener() {
                @Override
                public void onAnimationUpdate(ValueAnimator animation) {
                    translateX[index] = (float) animation.getAnimatedValue();
                    postInvalidate();
                }
            });

            animators.add(translateXAnim);
        }
        return animators;
    }

}
