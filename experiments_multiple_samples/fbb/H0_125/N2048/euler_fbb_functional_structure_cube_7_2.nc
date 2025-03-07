CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T104003        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�Ȭ�B�H@����4@!�}� 	�@5��n�@C�,�t�E@O�68M�{@W�W���0@`n��z�h@e���ݱ1@l/�U�n@q����]�@u���Y@z"_�N�@.Qj�-�@�d}��C�@�}�"�Q@��,�;@��q�y��@�cU"��@���h�@��y�@��I���@�ǔMX�@���݄�@��I;�X@��ǭ�|�@���c>:b@���8z@�]nЮ��@����@���`�z@��m�@�E��7:�@�Ღ�t�@���D̹.@�_|+�I�@�B4�&�@�=֠T�@�P:nJ~�@�|$q�]@��x�J$@����|P@�K�v(��@Ĕ���1G@����S�@�K��z�@ȸ�(Jl@�1*�Tʑ@˴)��\@�AK���@��6���@�<X�j�@�LZ���@���x��@��:��@Ӭ:ixC%@ԓ��:U@Հ��x��@�r8��'�@�hٶל�@�d����@�e�����@�k��+C�        ?Č�[��@~���}@(V�q}�G@?�U�8B@O��`Jo}@Z���[�j@dL�X�@m:cG��@t<G�0�@{G��U��@��`P�@�y�\z[�@�-Ķ$��@�.�k,@�#N���@��;: �@���יQw@�� ��q@�������@�������@���#@�|cW��@�����@�"� �T@·�A�u@ŕ5
@ȽbS4�N@�4zp�Ď@����s��@���0@�R�
UC@��	��3q@�qn�8@�W=�$��@�|Qy@,�@�q��yz�@�H�xsF@�Cۺ��l@�e��\�'@�����0@�$�sM@��i��@����I@�P!�q��@��_���@��j?��T@���oo�6@�|7A��@���|(@�Ԡ��vIA C,��A_�a/�A�r�Z5�A"9Wy�+A�;#|_A:\k�DA�AY�A
��� K�A��V��A�	)�eeAM{(�Ae3���A���|�        ?�]v�@�����@3g�bRf�@I��%��@YѡS��k@f6U��	O@qL��	;@yL]��R@�ę�H�]@�UN��R�@�e��}�@��UZi�@���kɅ@��Z��(@��U��@��ѥ"@��ǾR�g@�D����@��;�D�@��N�Y�m@��?!h@���;%`@�[����@�e	�~i�@�	^
R<@��3A$�@�!t��[@���7��@��۰��@���s@�Sun�]@�>�o��@���5��@�����@�V1�iA GXNI�A��ҬA���A.��!�Ag�����A
���05�A9�<�A�,��4ABN+&�A�m�7�0A��ИZA���~�A,�\ISNA®�y��Aa)s9�A���6A�$�X�AdLwxWA ��uM��A!hД���A"E����A##ض�V�A$��A$��lNA%��hf�A&���TR`A'vB/�G�A(P���        @���lPc@�I���@�L(�A�mN��A����A!�S�+�A)�Ǭ��A1�<�P�A7�����aA=�jX��AB���Z�AF��NҴXAJ����AO��o={�AR�=�i�AUvN?�AX��'�
 A\(k�3HA_�0b��Ab0���^AdP}��<Afׄ�Aig�<��AlCt�ENAoY���;AqU�bg�qAs�jAu�d�ƃAw���Ay>⢢�A{�@^�A}�y����A�F�|z�A��D��c�A�T/��A��;�i��A�!?�=�tA�ǅGi�A��-�n��A�N\�ӹ�A�/,��ZsA�#��G��A��� �� A������A��7ñE8A��8]0+A�����A�9�wI�A�vVg�A��~!/ɠA�	f'cosA�`=��A����XA�(G4!lA���a٣�A��mNhqJA�L���`A�R��bA���I���A��KKA�����<LA�^�y��A�=pa��        ?�'A��=@!5��S�@>.�E�lQ@P�����@]v�����@f봆�d@@ps�����@vR�K�@}
q�_Mk@�H��[�@�oK�h��@���Ypt�@��wi�J@��5`�@�T���F@�F�g�B�@�_���u_@���V?�@���%o@�Ľ���@@���w�A�@����ev@�}��y�@��fg"�@�������@���l:��@��H��@��#�d>�@��5�m�N@�7�m�� @��)���@��XY[;@�:��{@��N���x@��<R�@��/䉀@�"�E�T@��D�m@���A@�y�eA��@�OSk@�)!3��)@���5n{@��±+�M@�Ε�66�@Ƹo.aL�@ǦQ%���@Ș<��@Ɏ3/?�@ʈ2�5��@ˆ6VU�g@̈2�j&B@͎S؏�@Η�ol�6@ϥ"ثi�@�[!���]@�����@�r�W�H@� �/a3 @ґD�Q @�$:.׳e@ӹ��j�F@�Q,�^A}        ?�pQ~Z9?�89��m@ !�m�@1��}�@@*gи��@K>�0<�@U��H�J	@`I{�H;�@h�~���@q\��?v@x�����@�g��@�)nؼ��@��c�!k@�]�4祊@��Z+��@��G1t�A@�_F�s&@�8l�@�w�"g �@��s���T@�g5���c@�w҃��@���@�lvy<�G@�0,�J8@����@��!Et�@�W)�*#�@��n�G}�@�|��{F�@���"�@���q�@�vΆ';�@�%Yk�1@����@�	�;iǻ@�oם�@�d��yfJ@�8�8ӗG@�&~�Ӟ�@�.b%F@�PF͓|z@���-�+@���aW�A(ƙ²Am���3A���?�Au��CA�	��!�A	��vDA	����gA.���۰Aٴ�:�A���5JA1�����A!�9q�Ap�]-�A���P[A,)�G�AC�{� <Af'�X}A�rQ���        ?���?6@�!�(@/,qe��@B����D@PS�dF��@Y�С�Q@b�P>�\@jy���B@q��|�3@wζ�u�@2��jL@�<���@�E��� @����4��@��[P��@�����F@���Zy�@�,�H5�@�����}@���p�@�R��6:@�P�;��@���L�Z@��W��Y3@��r�J-�@���
Ĉ@��&wV�@��ʃ�>@�7.�޹y@Ǭ}[{)a@�Yⱔ�	@�B��+��@�59f|@��t�*��@�����@����`a@��be�BL@�5?*a&m@ܯt�f�@�V���@�
��@�U���@�2��66@������@���<@鑍�!`C@�)���f@���@���M)B:@��!��@�4u[q�G@�n��V:@����	z@��e�a@�g3ݐ%@��5�N�@�Lx�"r@���4~s@�e2�?��@��`$�A Z��e;A9E%�� A��R�        @�L�Tcb@�c�I��A�a�m�AA'~���A&C2[e��A1=��zA8�*���A@�M�AE�J�TKfAJ��g���APxB��AS������AW5�����AZ�-�A^�`��KAa�r��f�Ac�-f��gAe�/���AhL0@%��Aj�B;J�AmE����Ao�-_^ѽAqM��u�1Ar�?�KJAt+��=e,Au�I���:Aw@���NAx�'b�.�Az�=Y�J�A|K
K�/A~��1�A�M�A������A���e��A���R'kA���QU/�A�<Lw'A�-��K��A�Q�?t��A�}=&%��A��՝�ojA��]�
�GA�)�֬s A�p|�m�A���Y��A��%�A��B�A�d����A�$�[�aA���&�A��}��A�=F���A��Sy�;A���;MO�A�x�#�7A�:����A� �+A���4e*A��T�ĳ"A�_�<��4A�0,�;��A���g�A��G�l�-        ?�a���L?�����@��X@2{тi�@B"4�N(�@N��5��H@WS���@`��ۍ]�@f�ס�#�@m�S.4�O@r�?CF8#@wk���@|w.Ͷ@�D�9��@�O]�^�@�cм��o@��e��xQ@��&>z��@���aX@��:hV?�@�F�TM�@����\�@�2�K�%c@���E�@�}��	P@��8(@��� |��@��3�.��@�^�A�7@�X�1�h�@�n�cb�@��ᄮg4@��q��R~@�,�5��C@�op��@����x�@��n&i@�����y�@��
}$w�@�snax(J@��v�Eè@����w��@�#���V@��D$��@��.�ݗ�@��u���@�ue?�@�\y�>�\@�J*Km�@�>��5��@�:��@�>���@�H���v�@�ZgrQ@
@�su�B�f@˓�G�Q�@̻�W�@���9�@�"p���@�0��w��@�ԏ5�3
@�|F%�`@�(�s�1        ?̣�"�͘@ ^��]�@/���1J�@C�YHx̤@S?����`@_��_��@hNGf�@q~֙l�Y@xR̾���@��W�q@�Z�c�P@������@���_�]�@�U��\@� ^He��@���n1�@�z��t�@�\�rܻ@���+�`�@���w2��@��]&�h�@�y%�6)9@Ð�`+4@�
�vE��@��Ab�"@�6n���@��'��@Ԓ.�7G�@�j&f�i�@ڄ�' �@��r���-@�ɜ~T��@��Ѹ�(�@���ĴW@�D�l@�Ǵj�e�@�{Zf6�@�`����w@�=֫�@��IL/mZ@���_�g,@��I��j@�}�����@��8&��@���~���@����ɆA ��ch�A���AV6�A�9�+A,){��A�su��A	E��i��A
� �	(RA� iM%�As���	A)� �rA#��(JA&��f#�A3��V�4AJ5�e�Aj<}���A��i]��        ?�>H�a��@�w�.^D@<��{�@R�.!9@b�j�G��@oH�l�@ww	��p@���d�p�@�f�dO�@�Up0;@�ŲR�h�@��IU�A@�Mm�@��4�`8B@���7��y@�Lb'��@�m�m?�8@���f]wL@�� O̐@��	-x�2@��� @�i5����@�S࿉@��\�f�@�c�:�p�@�F�A��@�
���!�@�A�Ex@ծ�<�'@�TJ�%z@�8_�@�]f����@��<n���@⾋\�@俑�[z@��O��AD@�=ŝ�j@�ޅ�Ĥ@�nn�R@�% �h�@�03�0j�@��t1s@�����@�mc	��@�f���ݴ@�|�i��@��,x0�A 
���tAJ��� �A�H�Rk}AL��3�A}M��M�A�:mSA��IR`A
h�;�t�A7����AQ��:Ah�ֲAi�+T A%��!�AB����Ai�cL޼A��3NeT        @��=���@���Ǘ�X@�$��tA����V8An L��A$w�o�A.�k��|�A5�hmdA=��%��AC.T�m��AH3kE���AMЏ7O�\AR�;�TAUe#�M��AY��|A]Xi�j�A`��J���Ab��w��AeJW�G)ZAg�>R��IAj�6m�mAm[E�m$;Ap,i[ v?Aq��(h�Ash�j�PAu(1ʬ�Av����WpAx������Az��$8{�A} \���Aa���`�A��փ�#�A�!�U3A�h�����A��S���eA�,6�s��A����MΈA�)P|���A��avA�^m��A�p��:�A��3�x�A�ʆ�J�A��B��A����t��A������ A�����W�A���zo�A�ЎA��\A��WC9a*A����cA�L�ea�A���c�?VA�В���A�!S�Q��A�|&D}4�A�p�L��A�(>��[�A��S���A��14��ZA�n��$sA�;0�U#	A���5        ?��G��@1��}�$�@Mϋp}�&@`)�a���@lL��@uo+� @~�S?7]@��΋�ER@�C�c&�@�%�_�@���fvP[@�K���6@�[���@�A�Y�:@�\0�p��@��BLs�@�;wF�@����>+@���:k�S@�=穋�F@��ĭlp@���W�@�EBJ��@�����@� �����@�\K6#�@��a�̗@�V��Ѓ@���� k�@�򠗻�B@�p��?�@��`��h@���d�@��}�"�@�c@Á��`c�@�.�M�4@ň-FW�w@ƜJ	�?@ǻn6d�*@��6���@�R�-!@�X�����@̠4��hP@��O'���@�Al�7��@�Kʋ!E+@��u�9��@Ѣ����@�M�rYh2@��y���@ӡ��Zhd@�K�^�o�@��j7q��@ա���k@�Nc�H@��L���@׫�*��@�[�T�6K@�.��|@پ�� D@�pX�*z@�!�νc        ?��X�uRU@8w���@1���4>�@F�G�J�e@W��%˫m@e��@q��_\�@|�����@��{�M-�@����rR_@�Dh��;@�#:�j�@���$��@������/@�
�&&�@� f!J�x@�P{��ǿ@� @����@�M�蝳�@�hb/@��1l�j@��Z�ig,@�/�e��@�f�]b@Ե����@׫l���W@��U���y@�l�N���@�N�Y�*@�%;�i��@�P���f@�:�U6@�і�;@��JY/�@�U�EU?@���Y3@�� C�@�,�23R�@�׃y�Y,@���D-�@�q��=@�c!W��@�n�Һ`@������4A �fۑ/oAE�oAV��i��A��c�H�A �����AmX�q#?A���p�A
y&
BkYA��$:A�� ���A��6K?[A�����bA��+HSyA����A��F�e�A�����AΗh�xA���;�A���7        @
���Z��@A<�5auN@Z{Z���S@i��]�[@tc\X�@|����Q�@��\�� �@�=K5޶@��Ŋ�@�t��i��@������@��9(�@�/(��@�(�Z�0�@� �A9�@����u�@�h��s�@��ƑŞ@�jG�>@��9cE@�e���,�@�;��n@̑���s@ЮN�ວ@�JS���@��&]�@�-�/@�F��E@ߝ��I�@�J�� @�d�пX@�M��� 0@�Mľ�ӫ@�e՜�6@�L�6O_@��󫠋@�*�+���@�q��H�|@�ɴ
��^@�2�ϳ�T@��C?�U@�=��}k�@��鄔�r@���5�@�w u��@�ic,%A ;�̒c�AQ�l��$Av�oyA��8 hA�hR�ۍA>� ��A�u��#A	閖JA
��ʳ�PA-5� �+A��;��A�OlQ��A���ghA�L���A�^���iA� <���A�1(
�        @�9�r{�A�]��үA5�s�Ќ`AF�cK�AR��A��;A\ �Jx�lAc1BZc|Ah������AoZq{* As5�D0�Aw%KE~�A{�1���A�O�Q��A�-O||��A�i�ar)A�Ʌ���A���ɢ��A�!�9�~A�jY{:�A�ϗ~�UpA�I�*�A���A��A�U��: A��I��uIA�-��H�A�j�Z��$A��՜�Q/A��7�HA�k�b�xA�X�woaCA��e�cA��
���A�.�ܦ�NA����0��A��m-*%�A�Q˯Z�8A�er�I'�A�(b;�_A��`�:C�A����dA����&�cA�k��Q/�A�H�Am�A�'�zb�9A�
����A���ex�A�եoĎ^A������A����EA��nb�UTA�i��[��A�KΈ��4A�,0wډA�
��t�A��"�E�A�b���A�ϔw��A�=�PkA��LO�,A��1��VA
*�A��to��A�j�gKY        ?�\t�@!{N����@?����"�@R
�f�z�@`^�rg�Y@i����@r�pe��7@yͭ�c��@��y�@�w���@��a3�٤@��@���@�/Fe�P�@������n@�78js�@�+!���@�6�*>@�����@��3[��@���>��@�l�1���@�p���@���
�@��Qaלi@�N�WP�	@�0�l�Kp@�*�9��@�<>��@�eg��7@�����@��x˟ @��%����@����׾@�P����@ůg��M�@��5�H@Ȓ(�d-@��V$�@˥�8T1�@�Av*�@��E���@�M9DW@�+��%>@����l�@����3�@���dO��@���J���@��W�d@�����d@��(���@��|��<@��`捘�@����L{@�csG��@�=��c�E@�b3�g?�@ߌ,��s�@�]�����@���A�@�%�Ԓ/@�4�'!o�@�כ\V�@�}��H        ?謼2�U@*@$��@M��B��E@c�"����@s�W�q@����RU�@�{�om��@�\��!�@�U���@�񏉚щ@�1��S@�O�M��@�Μ��X
@����~@��a��}@�DwG���@�l9Gs�@����3@��(��@�I�FX��@��*֠@Բ���F@וzq.�0@ڸ 7o@�y�
'�@��-��Y7@����3Q@����[`@�D�!EC@�R��]@�P޺G�@��_s�@��Y�v@�qP��!@�E��6� @�	��5�@����� �@��h)��t@��~�Yx@�I�^�A 4yt�Agr�
A���64A�J@06A\��[1aA�vE|��AQ*5�уA	�i�ԁA��"P��AE!z5�A�)�~lAyy��Atkz��Az!�S�A���A���A��R,MA�y9�`AB\z�A�B����A�c�72�AJ�E��wA�ez��        ?����ݜ@(�[[�+<@Gl&��@[C,8�1m@i6OPZ�@t9�aYbr@}������@����Z�@��%�@�%4��2@�I�!��@�x�J�s�@�r-��5@�޲��"!@��\���@�#�e��.@���y�R@����@@��y!�@@���7�;^@ľ6��U_@�I�a��@�H��%�@�b�1�Q@��.��u�@հq�:m�@���b@�6��ss�@��)A��;@�&#�=�@�V;�"+�@��%���@�|��?@�w�l@舘)p�@�K+p@�px���%@�v�4�i@����Pc�@�����.�@�u��Ca�@��)F�A �Fh/*�Aw���"�A"(��uA����	�A}M��e�A	Y,�E&�AM�OQ?A\F2��#A��V�A�]�I6�A���>�AQ��=\&A�o��A����uiA`�tO��A�c��<�A_
�@��A��n!7A��M=x�AK�H"�A �D\U7        @����'c~@�^В�A���IMoA$����A3H�1�a�A>������AF<E���ANJ�@�(�AS�|�d�nAX܀��ЉA^��D�AbXܕ���Ae���</:AiH貦C�Am!�� kAp�0�k�Ar���o&�Au��+�}Aw�w��pAz�`�b�A|�$���IA�Z"��A�H]���A�շs�7�A�t��h�A�$�+(��A��Hu�%A����MU�A����*�KA��3�?cA���F�G�A���x�W�A�뙥���A�	�&5��A�1ki�(A�bۢ��=A��H^�A���Ɩ�A�3��
�A���j/�sA��-�S��A�`�V��A�ي�Hh�A�.;	8̰A���К4�A��]H���A���_�fA�f�-Қ�A�A���*A�!�sדA��Y,QA��M��A��}��=�A���R�eA�����Z~A���Aq�#A�Ѽ��g:A������=A�����&A��{,��A�
�`�:�A��z����A�+<I��        ?�z'd�T�?��.���@�4q��@)>|'K�@71����@BeF�F��@J��7�o@R�jhM�@X_�+� q@_{�_#V@cEM �[@gi��\�s@k�GR��T@pv/C��@s'm�;8�@vb3Fv@y2��� �@|�8g�V@����>)@�8���@��\�?�@�C��q1�@��AQ@��@�e���@���ԯ��@�=�:]*�@���o�@�<<Ԡ>�@��:wJ-�@��V�_��@�C��K@�ך@ @���N���@��e�Z�@��>k�;�@�	��p�@�h52�G@�>��{�R@�f���r`@����>Q�@�����@�"��n@�V��f�"@���R�4Y@����fQ�@�W���o	@���#n6@��m]P�@���I��@���Bh/@�A��GM�@�ckH�@��C��2p@��]h� �@�W���`�@�%g�&9f@��}�kw@��(
���@���ָ&�@��G"B'c@�a@�
8@�F�_�� @�13����        ?��цp(?�Y��#�/?�ݽ���V@C�m�@����n@"�!'$�@0��W+}�@<��g+�@Fc�l�,�@Q,"���@YB����@b%���@i~��<@q��Z�@w�8%�r�@���u�O@�ڳ'#E@�]��,@�IH�%Yj@����@�B���,@��M~p|�@���TİW@���̸x@���i�@��^;��@�>��|�@�����@��"�fgR@������@�>/��q[@���%�@�8̵/�@̬R$^�Z@�:'5��@�J�3d�r@ԉ]�(��@����� O@ٛ����M@�s���/@߃���,@�f�s�@�*&l,@��5>E�@��L?��@�4��eV@�|^^��@��i9k!�@�;���k@�4:���@�7DT.�@􉄀ܘ�@�!�s��@��@Ik�g@������@�l����@�]b���@�eT�'��A �h%��A�����A�P���A9���{Az��M        ?��;E�h�@"�]Ʊy@@@2�̩@Q��-��D@^��*%��@g��� @p�����@v�Fos"@~;�)�"�@�����p�@���/H0@�<����@�K��s�@���^��@�>��`Z@��'�[�
@������@��Y��@�~a�Fa�@�o»@�e�I��@���oے.@��OF��d@�|Q�,�@������@�=��Ny@�E�u9��@ă�$�}�@���H�,@ɮ<Ցa]@̡sJ�@��r�SfM@ѫ�o9*@ӑ�v{f�@՟�5J^@�ٓ�Zt@�@�a��<@��i%T��@ߢ���b@�P��Ѥ@��p�nC@���G�|@�{��T�{@�r���Z@���4*�@��D��e�@�'�ħ�@�׵��8@�0�\^az@�{ᵴ1@�%-Ã��@���+��E@�y7W�X�@�I�]��@�4��@�;�Ed�wA /����zAP�|'w�A��fl�A�ɩg��A��^:Axw�m�A�i�AF�        @���m�;@�"sZ���@�����VA񭇟�A�Nt�J@A-)xΖOA#:��e�A)���v�A0gC���lA4P��&�A8���ZHA=�p�!�A@�I�.�AC|m���AF)�B�RAH����AK�y?���AN�&��<AQ���AR�M����ATn���AV4	i���AX��ѢAY���?�A[��တA]�U�NҦA_��/��Aa
�8��Ab#�O�AcC��}&Adj��t�Ae��fAf��}kAho`�AiX���:Aj�3�locAk���1��Am_/�� Anƕ�'��ApP,3dApֹ��z�Aq�r��sOArZ<��j�As")�YvAs�J�*�At���G�Au�O;ݩrAvl:��WAwIc�{8Ax*��p0Ay)4Y��Ay���Y�Az����aA{ؖ�E1*A|�y0�A}ǴsԼA~�x�|��AǊ��dA�g�X?�A��Rt�A�t�*q�hA����ԔA��"��        ?�AK��cu@����F�@&|�)e�c@;N�88c�@I��ө �@T�Z7�,u@^�.��N~@eq�8/Q�@lMB�̗�@q�����@v:�NJ	7@z�2:��@�s1�4@���vњ@����F4@��X�G�@��s����@�0]�8��@�X��@�*���Fl@�)�*ߵ@� \t[(@���e��@��؁!@�B��l�o@�}^��xn@��йb)�@���h�M@�R"��@��F��
#@���=@�>'�s�@��o�.�G@�	�����@�}�A"@�����C@��d�9c�@�
�TR�@��b���@���3j	J@��,���4@�h j��@�O��֮@�<ZX�@�/�o$��@�)�zy@�)f���@�/��,0�@�<v0�)�@�PA�@�@�ku<�1@������S@��f�Z�K@��-f�@����1N�@�<�z4�@��F�倱@�Msu@�Kp�l5�@��_�X|@�i' �@Ņ!���@�L��Z)        ?���H[�@.Z.��@PM�p@dp�{ �@sS�Z��Z@*Br��@���(��@�ru�
��@��[��@��,���y@��R��w�@�}�/�-@�߈��k@�z�o7�@�����wa@����\%@��qț�@��r+|��@2���@Ť�ތ�@�	;�'k�@��ἀ��@�x�9sb�@ҿ�6=5@�:����@����K8@��y��g@� &�rB@��SqZ@�g+\Z4@�oP]��@�~�5�SI@���Ь@���f�@��z%@�eFqϢ@�v18l�@��/
?ٯ@􅪋N��@�1��Z�A@��\V��@��#�J��@��}�� �@��{Z�~A �!Q�AD��anA��g�A��jW�EA.�nd�A��+|�A�*Y�A	�Kރ��ASA43�)A���uA�]Id QAROE�9AF��%��ACƮ1/5AI�:�AX	����Ao �AA�҉�gA�:��        ?�?�~v��?�*�����?�o�	0�[@��Ol@Y��)�u@,�Pc��@:>w�d�^@F��K@G�@Slw	�e�@_�K�y!�@ikE�ͯ�@s���Z@}�Go���@��\���(@�Ӿ3��@����-��@�l�R�("@��YG�&@@��/��@�&�4�c@��Jw��@��!^*+�@�j�
���@Ť>�Q��@ʣ�0jC�@�A=oh�@Ӯ31k��@ק���:�@�?.��{�@����-�@�Ǡ@S�@�8J�7�@� 1��Q@�w���@�C�?�KJ@�7�9g@�3�5�@����>�_@��N����A�����A^/��`ACu���A	��^7�A)l�z>9AX����AG>lyCAc��ۘ�A�ʌgi�A1�QJtA��%:`8A�$36
�A!��x+A"�3`1�wA$�.O�`A&��B�V`A(�fM��A*��(���A-r�Ԅ�A0
B.�PUA1r��v��A2�Ʒ�l�A4�,4$iA6I�[2�        @�iҘ]�@�M���Aɕ��]�A����A$z��?A0�I�g>*A8J�v�P�A@�W��AE�g�AK��(��EAQsΠ�AT����uUAX= /X�A\4%�]p�A`2�ޞ��Abfr��#Ad�� ��AgԖ"��Ai����%GAl\d>�%An�W�P��Ap����>!Ar)k���As{r* )At�7ںCXAvj�¾.YAw�	�MEAy����A{!KǼ�JA|ɹ̴i�A~}����A��:G�4A�#���A��'�A�pA���dur]A��{�Rm�A��JS�O�A�ϡf�0lA����A��"��i�A�O�"A�$yĎ6A�Mw�� A�~XU�1�A��Y/��'A���t�A�!u��A�����A�yyqĦA�,�yxA��}
��8A�����A�gC�n�A�0�h��CA����{غA��L����A��{��A���r A�o���1A�Ux��$�A�?|��(MA�-i\��7A��4)�S        ?���@4o�#��@3"�礧Z@F�@�	@Ta���@_�1;�u�@g�m��@o�W(z�@t�6c[�@z/B��Y�@�_m��
@�m��_@�KYC>@�� P�Ue@��x��f@�����&5@���d�@�b8XXxv@���{CA@��x���@�d�A���@��R���@�+����@����#�@�fk�&�@������@������@��T7^=@��LAf��@���l�5@�bx�p�J@�v;_�8@��C����@��KU��
@��5�|�n@�&/��Ku@�ku?���@��@��X�@����c�@�z��&�@��;�S܀@�c��˘@���/6��@��b�/Ƶ@�����*3@�Qx����@�"����@��9Ae��@��Q̶�!@ŧ�U��.@ƃ���~>@�a�%/�)@�B����@�%��@�9��^�@��du�%�@������@��2�UZ]@ͺ�v�o�@έ3N��@ϢN�U�@�M%�{L"@�ʔN��;        ?�u�e3F@P�Q�w�@,��#�X@?���r�3@L�;M��(@W'�o&4@ao;7�@g�C�HN@p�ѡh�@u�n��a@{����@�+�C1*s@��S�RXx@���@�@�|��?Ry@�9 �seA@���O
Q�@��'�@��� /�@����D�@����7S�@����({�@�M'���@�����@�G(���@�{ttʝ�@����O�@ý��k�@Ʃ�XK�@���I��@�dO*�G@Кk��@ҨIQC��@��Tz���@�9����R@ٿ����@�n����@�J��:=@�)���4@��@���@�}�e�&S@�P��kY@�?d:!y@�N��@�}�ʙ�]@��~�le�@���k_�@�� {�@�V\8�c@��+ӭ-�@�^��^#@�e@�@����1�@�����E@���_j5�@����A ��9��A��q�AU�悔A�+�UnA��`��Ai��J�#A�C���        ?�����@!*��«&@>O'!��D@Q9G��@_	
��@hrr���@q҆����@x���C�@����w�,@��"��@�R<Y�5B@�� ��5@���~�7@�"~����@�@�Y��@������@��t�@�@���R���@�r����@�K����@�kw>x�@���YѪH@��8�XC@�ho$�g�@ù.�G��@�Lc��@�*IP42@�]0�@�@��[�c,t@���H@�(��6�T@֛Tei@�P$ �h8@�MYj��@ߖ�l���@�d'�{M@㒡R��:@�L^���@�a
%@�@ꖻ��@�Q!���%@� -`��@�ǰC�@�bWeL�-@�.����S@�J3��\@�%���=@�R��|	�@�����EA j/���AX�{��A��
	"A*L-���A��!��AH� ��A��f'}�A
��x�@uA�]�u5aAl��TyiA3(��o�A9ŁBWAJ�+F�Ac��/�        @�H���@�+	F�z�A	n�|��A
��t8'A*(_�j��A4��V�?!A=���Ur�ADL�O�>AJ��0AP`��P�AT�_<u(AX���c�A\l����A`�@(�Ac  �m+Ae�zO߫Ah\���Ak@��)�AnH9�F��Ap���j�Ar`��U�Atza��Au�i�YAw���)Ay��l�A{�k�O��A}��ShkA� h�A�܋��-A�:x|Hg�A�iGf���A��euv�A���y�E%A�.">�1 A��bB��A���
:>A�J�'�xA���@�~	A�;=ŗ�A��c���oA���j���A�w�W���A�J13��tA�!��%�A���|�#�A��_�>)�A�à�ض�A��H�j^�A��/B�zA��(���A��#�`yA�|��L<�A�y�8Y56A�z6� \A�~ ��A���*]GA����Z��A�M��:��A������A�_0���A��қ���A�u��w)A��/?�        ?˕��ʵ�@ ��*�2!@N g�g@1w�n؎�@?�m$VĀ@I|�����@R���]@Y���޳@`�o(�~@e�o+���@j���a^@pG���ۗ@s^�>�u�@v���O/@zDFf�S@~ƚ_Q3@��.���@�V�6�S�@���?ʞj@�YU2�,>@�)�!��@�2�%ܰ�@����h @�|�@�@�]�p�@�_���0�@���*K�-@���V|�@�=��^@��U�<��@�MԱܳ&@��(w�,�@�T��![�@��p��\@���:�a;@����Og@�w�@+��@��t��@��B�'@��I�6g^@�%��7�@�i�V�)@����@�@�(�/��@��d��J�@�3,�[ @��	DE�R@��5F
r@�S�u^@�2��Z@�Ybt�@�Y�k��@�$��Փ�@�?U�V�@�f,�(��@ƙ�(-�$@�ٲK�l @�&˭c#0@ʀ��d��@����?�@�X�j>_@��h���i@�/J	~�+        ?�M��h`(?�f5�RTi@	��:�@"̱���3@4�c�{P@C�	�M�u@P�x�3��@['$��@d�q�+�]@n��=�]@vd�8�@��]�@�.S^�@�2��'}�@�K����@��	Fa4f@�|�^�P@�u���z@�tx0���@��&m�,@�W�<0v@��\y�B@�Ys� �@åP�!M@�h��\@˭-A�ڀ@�=S}鯣@��/�M@��X�7@�4q�;r�@��x��@�enO�7@�3K���@���>�&�@�n.�-q@�()��B@����@�ˢ>�3@��`�m]W@󊛆J�@�j�݌��@�f*}Kg@�|�1�4@����� x@���O8YA 0�6R9�Aq]��$A�cs�p�A�K�*A}Rj~�pA��L5�Akر�W�A	�[Q�3�A���AXA&p��avA�W�%�aAA.7é�A���@A��cA���0�A�!�m�*A����gA�|��H?        ?��ՙ��?���'AJ�?��"�@ �$�wN@5�g��@.yf*Ӡ@@������@PX ����@\�lH@g�G§"�@r��ங@z���@���u�@���]�tm@�Q>,�@��3m7�@��D�@�����@����u/@�,Q-2�@�fq(�@���`�U@��*Aw2q@���gb9�@��o-_L@�Z��/@�;ǯ��@��(�b�L@�?pWd3�@���3�@����#�@�'2;��@Ր�.�@�0�LS�@�0Mg�@�"��7��@��_0J@�\H<T�@�x��X�@拧���@��7��n[@�#��i��@��~8QQ@�.�Z���@�IbM@�"��	}A@��O�
8@�td-�_@�B��7by@�*ڀʞn@�-�B��@�L'B�iqA CS7��An��o�A�I���`A���AJ���,A��w�8�A)w�U�A	��2<[	AExM@רA�3�&uA�m�S        @�M�Y�J2@� .�6>@�sT�Z��A �Џ�5�A�T	� Am&�A#�Dy�m�A+]?��)rA2F���� A7�$q� A=�4���>AB ���E�AE�8�C�2AJ�)�AN�V�AQ��3�<7AT�V�qnAW�ox��^AZҝ��A^dcނ�5Aa"��?f�Ac=!�8<�Ae��h�y�Ag������Aj���cS-Am{]���=ApF�cIAq����z�As���ħ�Au��Z���Aw��=}�Ay�]���A{�Ǵ��A~e�K��EA�w��C� A��D��A�3�����A�����~A�5���5A��|�.ĳA��f�+�A�L�S�4�A�*PE-�5A�D���A��5��6�A��M��RoA��\�WwA����1�RA�2cþ��A�|�tD�A�������A�?6MtEA���&��A�CX6���A���W��.A��6.�4A��86�AA��F���A�y�P��A�oք�kLA�m��A�q!�p� A�{qO1L3        ?Ǎ��b�?�I�#��@�N���.@1i��1&@?G��|�0@H��Ϭ?@R|�i2|@X�����@_�⣠�@dRb�Cm@h��N3@m�\��N4@q�9���@t���t�@w�(E��@{h���e�@A�ŗ��@���_ss@���t'@�Xv�5�@��%8��@��V�Z1@��ʚ]�o@�؞�3 /@�����@�@)n\�@�[�7�@����C@���.�@�ENf=�)@���)4@�qB��l�@��B\�=�@���䷎
@�N��?b�@�������@�4��W��@�Ĕ��@@�ih����@�%-s� M@���@q�@��6�8�@��i:42�@�	�w�\�@�'*��yM@�P�¾g3@���o��B@��F<��@�����@�n�Z�B@����ܱ@�D�kX�@���m0�@�H��}�n@�n��`/@�=�̣t�@��[l<@���O���@��j��?@ĻA�lQ�@Ū�,!�@ƠɅ"�@ǝɼ���        ?�f�Ϻ@��:�k	@/�7�D�/@C�ge�@@R��E'�I@^�0�i��@f���ܛp@p)��H�@u�6.>@|���@�@���p:@�N�
�K@�8�*~-	@��8��@�O~�%7@����seL@�Yo��@��やn@��ܮ?-@�к��@��8w��@�|�q�@�gp���=@�m��@��7�Av@ʫ���@���qp@�ۄ���[@ԁ!�E�r@�pD>}G3@گ9u�< @�DrO,
@�T��@�E�� @�/�@�5�RKT�@� #�g�-@��B�w�@����df@�V�De�Y@�*���|S@�EW!P@�$����N@�Ie�9��@��Kµ�@��� ��:A ��󨎼A�L>U�AA�d�EA��\�&AQ�a�@A���>�A	��/�mA
�����AJ���s/AZRG�A�,e�<|AѻY�viAȠ!�QA�����Aպ�.0A��
���A�*J�        ?��5�4^F?�]�����@�GO��@/DP:t@=�ҭ�&@I:��|4@S�xeC@^g޲U@f5���@pi�;L\@v���R@�[<a@��u#�@�����eM@��6a���@���f�$@����?��@�Dj���w@�)51��W@����y4\@���ۚ��@��3!Y#�@��Y,���@�>�9��@�:Ҫ:�@��Y7o�@�`�Z�ſ@�5T3y/�@�a��}p�@��n����@�s�.���@ҩ�1�4�@��K�@��)צ��@�ݤj+B�@�2���@����_�@���"��@�#���N@�L��g-@�'L���@��2�_�@����E@�[��s@�y�ȃ@�e����@�u:�:�+@���5f�@��h�@��'?��A �Ovcn�A��)�A��t΀A �J�A���A�-�0g�A
x�&��dAr���A�ؕh&�AY,S��A| �p�)A�(`ѨLA�A\)        @��us���@��k%D@��5u��1A=/��jVA��i�A�~k�MA#jc�a�A*��b�A0�9��A4���F��A9%����@A=�,�}�AA���zeADN.���AGSY�I�AJ�4�t?AN"�G�^�AP�w���AS�U��AUF��CoAW�<��AZ<�bA\�R�Kj#A_�\D�(Aa�� i_Ac1[�wqdAd�hC�Af�9���Ahʚ�4�Aj�J;v��AmN+NaAoH0���ApҔ���Ar���!IAsYT��gAt�R�(��Av['���Aw�u���Ay$~]�_Az�Uk�]�A|s|}�;�A~8
����A�
a��A���A�F�A��$��dA�2C���A��1�TiA�5�fZ A�\���A��ί'9�A�ǵ���!A��1��CA�\x���DA�����hA���-U�A���_�A���u��A�G,�,N�A�ʂA���U�N�A����˱�A����P��A�x��4��        ?�<�%�Ӛ@�X}��
@%��t��@7�n%z|@EBP3�@P�o��i�@W�T�>@`F	'��@d☁�<@jJ�RD	�@p'~)_@swp���@w~`��F@{8".�@=��d�m@�䃠v@�Q�ud��@��X�8�-@��R�kܔ@��[�~�i@��u���$@�m�(��@�!���@���Լ�H@��;G�O@�˨��\=@���57�^@���;@�B��h�@���׷�@����-x@�CF�5f�@���"�n2@���n/@�O���v�@���6gXl@�@,b�O�@���$T��@�d�J�C@�����@�_f�7L@�@��A@�'݉�,�@�_)@(@���S;@����-�@�h�}S|@�"#*��Q@�8����@�W뾝��@�5`��@��绥��@���?��@�'�.�@�pu-�@�`�U��i@��3��@��D�#T�@�osf6�@�&1��.�@���	��D@Ğ�P��@�`v���D        ?�m�V�?�ȿ=���@1�����@'�gi�jA@6���F\@B���R�@MFI�Jq�@U��/Ź&@_3�G+�@f5FYi�P@oJA��	@u�Q2{�>@~
?��@�it��Q#@�Z�%i�9@������@���\l�@�NH?�@�?�YQ�\@�(��{@��d�QR@�f4� _g@�[��u-�@��P�g@�xm]@�6��mM@�R��Z?@��c�@�'{R��@�X����@��,�g�@֊�"�V�@�z���d�@ܧ�QK9�@�	f���@��j`�݆@�����څ@��?�
�Q@�,~�|�~@��g�Sg@�9�'v[@��^��x@�A�U��@�OD��@�H���q@�뙷�N@���W�u�@�u!����@�^���}�@�b�%QV@���ϒ��A ߞyO�A��1��AIq�A�hxk�A���oiAXE�A��A�g��o�A
W
#A�;����A��� qAA�]`5VA����        ?�]���@�Oߢ��@*a)�D�@@�t�"@P�,֓j@\HG�&�@e�7�
\�@p&� >P@v٘O���@�T|3�
@�M�Gˁ�@�\?���n@��5��`	@�$ O>^.@��>>�@���a�lD@����Y �@��]�?&@��{�{�@���mip@��3A�
�@�Ŗ��@����4@ǫ����^@��sb�Y�@�<���P@�Օʜ�@շL|��2@��;��?@�b���J@�4r���@�+�U�7@�j��$�@���
�T�@�t)�F0�@�A��,/}@�AC|	��@�:O��v=@��K� PN@����
r�@�����@���i)@��m��ɢ@�T6�C�@�fs[h�A �}�6A;kN�A��V�;	Ak4 mZA|��m�A{@
�A	��E���AJ�4�
AoФ��AͰ�;��ASA3]AGt40�ACyX9�?AG^sj�LAS7$��TAg.?mA�)�t�#A�{��_?        @� BFf7@���V��d@�FQ'7e@���P��A��AopJ:Aע�c�A%@M��F�A+٩�;��A1�2h�!�A5�K>�*A:�%��v�A?�㒫{AB��;P�}AF!��%iAI���AM{�Q=AP���; AS���sAUv� b�zAX�2�wAZ�`=iA]ͪ��$�A`G�X�?Ab4Zd�;Ad@���Ae�"�H<�Ah�̉�Aj>+�~8�Al�r�f�AoS���ApԞ��	Ar5��c��As�oy��Au2�kQ�Av���
��AxzӇ��Az;z�{A|�==�A}�����A�R0ΐ�A��y�2ppA���A�%�I���A�Jw֬�A�z����A��,UexA��ڛ��A�NW�~��A���eb\DA�5�]'A����?�A��g�[A�N�)�A�7?)�A��Y1�GA����hA��D��yA��_)��A�m�-�A�\4��qA�PŘq�A�K���8        ?ɛD�1�@���.@ ����H�@4<	I��@CK�3i�@O�'��J�@X+� ��8@a���@g��g�@m����@rؠ�=�i@w-���@{��K�>w@��o��Xq@�u��g��@����Qn@����b@��@8AI�@���3��@��wF�)@��ء�Z�@�X�\��@����b9j@�tl��L�@�2���Er@��S��@��xpc۽@��Jw+@��f�4De@�Yk1,K@�$�r��@��#pf�@���Ϫ�@���D�E�@�nm��O@����c@������@���-y�@�rK�@�\�{8��@��Oڣ �@�"�<U�{@��@o���@�-x~W�@��C��z@�~q����@��i͸*n@��&�#�@�|u��-D@�wsc8�6@�{L�K�@ň0���@ƞ;fV@ǽuM�ǂ@����T�@�[����@�Q�3�"@̕{"�71@���E�o@�6j�@�I��3�@�����t@ѱ��jjQ        ?��.I��@���ςV@<i��J�@R��E2*x@b���;�@p64��Z@yo(���@�:�C��@�MY3��@� c:i@�G��F[�@���G��@�W=M�@�qH�@��[�q}@��e-t�A@�)o�|m3@�����k@���	�]�@��?^S�\@ÿ�&���@�I;�2�@ʲ N���@���Jj��@Ѱ���{�@�9�R?�@��F�@�%0�V�@�y��2�@���}�@�U�10@䷺��V�@�
z}G@�q�d�@�9�|�&@�n�^`k@��Q��@������@�v�Ⱥ9@�Opw���@�D�;�@�U��Y�@���u�|�@�� �2�A �&��A�����AE	
��A�w��uA4Ɗ�]A���?�iA	v?��A7j'ڒ�A8����A���!�bA�(�sTmA��?R�A�ǠN�BAݚXx�A�V�#�A`�N�xA�c���A!ߕ��!A�	W-�        ?�D�h��O@$�����.@E9\w�p�@Z�+�z9@j,,?1�@u�Z��'�@�db\ ��@�2�d��@�t�۰A @��ۙ0&@�����m@��@5�p�@��B֍�(@�C�%��"@�x��6@�)��X@�lߘ��@�E���@��x0@�����(@��J��7@�K��@��կզ@ʛsM@ͅ_�n
�@�Qcl'_�@��b�ZLd@��`A���@ռ¶�@��k|-�@�U��@ܓ�q{fI@�=<�8�g@���ڍ�@�A�zρ@�F�Q0u0@�8�Kq4@� Evg��@���wr�@�J����@���5^@�!=wZu@��?�H�t@�dq7��@��V=p�@������@�?ݷ(t@�VNOX@��?�_�@����boA ԖWA,���rAZ� �)�A�O%1*�A�(�AD����A�e�H{�A	5�[��A
��C�An�jv%mA'�&�|�A�r�q8_A꼂GH�        @�����@�ّ@�3�A	����g�A P��D�A/���*A:2Y�|��AC~�!:{�AK?���WAQ�A�AV���F�A\/��
�A`��g���Adq���Ag{p܀�Ak���JAn�
Ĭ�Aq�x�(^As�1��?�Au�V��Z$Ax`����-Az�>`okA}��@�)�A�2x�]�A��l9q˄A�6}N�ߏA���b�KA����v1�A�E-l�A��&f@A����q��A���⺲�A��I����A��rںUA�rM�;A�5*i
R�A�[/�:�A��z�[�^A��ž}��A��u�@A�LC<��A��qo��A��ĩߡ�A�KD\���A��{���A�.�[}A��� sBrA�r�~lH	A�,��|�A�闸R�YA���k�� A�l�Q%u�A�3��A���0L�TA��ۻ1*A��9���A�q5����A�J>loA�'��4��A�	7���2A��i�upA��)�O�A�ɀM�TA��w=���        ?�铞;�@#��B/�@AmǏ}8@S�8�e�@b	��8�e@lì62?�@uT�@�@}@�8+�@�k`q?��@��k�Y�>@�.;�0@@�H����@�筠�[	@��H�M@�����s.@�A�j��@��..Ms@��>����@����]K@����@�����4�@�v籐�@�^F/H?�@�^.Q�@�u~��^h@��&���@���!S��@�F�U~��@�݄�S�@�#➶�@�v�6�}@���er~�@�Dˬa�O@���F{��@�N��@��(��"@̙�y��@�XC��@�C\��Z@�b�66�@������@�,�+��@�Ɨ�A�@�%�XB5@�BQ�
��@�f��u@ؑ��(�@���`ͧ@��*$W�@�7��u v@�{��f�@�ƒƠ(h@�N��'@��-#�g@�h��'�@�:E0��@���M�%@�u���k@�I723�@�	X"�P@��.{~3t@撸X�cp@�\� �        ?�Aj��ت@�'�~-@0D��W�@F�9���@Y��I�{T@i!Qh��v@v��{4W@����@�W5@j~@��6*�@�,�3�֎@�_���Q@�h$�)�@����0�@�=po;@�ʄ�?�@ö.r���@�i&Ҭ|@�+�{"��@�v ��X�@Ե˙9�@�Z��H5@�i]��K6@�s@��@��}��=@圓��{�@�݂���@붩����@�!$�6p�@�e�uF�S@�[=�)�@�q�Z��+@���B݀@�Q���-@�{MOn;@���@
�A �܇i��A\ff	�`A��<fGAy6A&.SA��A�S���{A
�ʹ��NA��Pe��A�A��&Av��m�&A����D�A��
 ��A99`HAa��q�A�_����A;��a��A�,	���Ab?lY-A����A�UoѓA [N�5bMA!T��,B A"YG�'�A#i��4(A$�Ł���A%�הЅ�A&��L��s        ?��M�y>C@,+H= @9$�}UX@Q����@b����,�@qC�q��.@|Q+k�I@���B�@�8�
��@��!�q߮@�t��8@�����@�O����@�,s��3@�	�4�_@����j�@���
��@�����n%@Ď�&�z�@������@�i{��W@�CH��.�@ѵ�M\�@��D�[�`@�Yo����@��6w�"�@��c=�n�@���C�6p@�C�A�@��i��Q@�Ŧ�\@�jZR!��@����ɫ@��,.��g@�E-A��@�`�$�@�>��@�z��4�c@��1x���@��؎���@��;V��4@�O�6�`A d�b��A�� �m�AL��Aa��Z?A�*��T�A:�o�BA�����A
.o�-A���>�A.���PA�+���8A��t��Aړ�[�%A�]�!v:A\H+i�A�^�(A�)W�P�A�'����Aj<�۪A2�ΝMaA��+��G        @�YSU�@������,A9�^x��A+n��f�A9E}�� AD9l�]3�AM��C�AT��l�y�A[1��v�]Aanz��Ae�@"�FAj��|���Ao�+4)�Ar�@kAv�7Aygv5�)A}�0��A�xk���A��>���>A���7`�%A��(��A��ܪ]��A�8soG�fA� ��]2A�����iA����ďA�)�Z\A���z_tA��9?�HA���D>��A���x�A��n�y�A��w�A��1��A�U�OڞA����<�A��^f�:A�P��txA���KX/�A�O!�9�A��?�G�A������JA�RN�ڋA�u�Y�>A��X��b�A��w֖A���.��KA��bq�%A���p��A�M+)=1A�+T��A�O ���A�{��Z[�A��2rWcA�����A�6q�(z�A��o	�8>A��4��I�A��6�-��A�O���A�%k9�
A¿����A�}#�;��        ?�ζ��"?�i��Q� @�!�@,�$*D��@:_���C�@E]��c@NɛWT��@U+�>+i@[��?�<�@a��y��@f����M@j�OL�Y@ptlt@r欕d��@v
'�%��@ys�uc\@}&�S��@����V @��T��zF@�L\�x�@�|�l�@��"5Kp@��]Uj߮@�ʲI��:@�o�(@�=@�����@����B�x@��IoT>@�dN>Z��@�T�ޝ��@�Zsn�~@�t�mL�+@�RqAci�@�ue�;�p@����,��@��~��e�@�#C�q��@�u;��@�ә�A�\@�>�u�,@��_�@�:Bw�
�@��V��[@�i|��0@��/"`J@�g{���@�J��XC@�5j�M�@�&�����@���=�@�ON��@�$��M��@�1u�X�@�Ehh��@�_��`@�f���@������@�ҍy@�)����@���6;�@��d��Y@�`6����@�;�=48        ?�7�nR�?�[���@,�/!s�@v��|@,_D�G�@8_)g/8+@D|�����@P��@Zܬ\�.@d�[kR�@oL�nܗ�@v�N��*@�E=ua90@���*@����p��@�P�����@�nd{�S@���19��@�Dt5��@�k�0�)%@�:E�Q`�@����i�@��}��(3@�����`+@��F~u�@�3�^��@�~���4$@�l}?�@��E�TZ�@�^����^@�RF,87@�Aj���@�v;̒
E@�$ܥ���@�����@����6͗@�C\�*��@��z�	@������v@����D@�9;H@�J@�!*��@�ƛoC@�@�l�Y@���ݾ�l@��=�@��,<�A ̓/B��ASZ�.�A�x�h�A�3Rկ�A���'�hA	m$���Arr�pFA���U�SA��DOyA)�퍎A7!%��Aql�R�KA�v�+�A��t��A]y��9A�37�<�        ?��u�q��?�U&���?�g"fKI@
��f)G@������@+�}���[@9�8���e@F�{����@S`
qx@_�x�~$@i`��QV@sm�i	@{��Z�@��?���h@�	GK��@��n�@.@��)?z�@���&C@��5����@�xO�k�@����6��@�����>;@�ɞ��_a@�9+���a@����@�X 
T�@�b�t6�@İ�Gg,@ǚI�p@�����-%@�L~ 垃@�Q�}N@�:Ө�@�R�v�@ױ� �@�6WO��@���?��@߰�Y(�@�Q�CMOC@�ܪ;���@�w�v�͕@�"�(��d@�܃c}�@�1*�s�@�|����f@�b�-?b�@�X!�@���I]@�����@�ˬ�]%@��ز{P1@�
���pU@�7��݊D@�n3FrB@��+Kp�8@��^O�GE@�M��@������_@��x���@����=r�A ��E?b�AN�PLH�AǓ�M�        @��m\T�@����,܈@��Y�xT�@�4Ӻ�V@��� t1�A�=��]hA
ˍQ��9A5���A��If�}A������A"x��H�A&X��5A*��N�t�A/Q���O�A2:^H���A5y�2A8q�FA;V�>QA>ٟ��� AALC�_�ACH�s���AEa�63�rAG� u��AI��r��ALW����|AN�7��>AP�F�%�AR*3��kIAS��F��AU!���qAV�_;���AX\�/�G�AZ#q�z�A[��Br�A]��e��A_�e�A`�����hAa����%�AcP1uV�Ad1�<;��Aec�p=�NAf�q�x�cAg�omӲ9Ai;�~�Aj�x]�_Al(����Am|(RJ��An��t�S�ApHV�$?Aqs��sAq�n��Ar�dC��tAs�n�K�At��tnyAu�Ŕm�Av��.���Aw�N��Ax�����Ay��S<��Az�&���3A{�1�\A|���A}�M�b�        ?�cQm^9�@?uG�e@9�h�.�W@L��A:�@Y��Q��@d;<mG��@mT���t@t�_��@zH�Ĥ Q@�����c�@��J}f@��1��g�@����p��@��O���V@�S6�ux@�Y��O��@��v�2��@��ND��@���'�M@����:�@���N7j@��5+�i@��wr2N6@�
x^/��@�f�ǈtb@���ؓ�R@�:T�|Gw@��a��G�@��"4�@@�b�e�@����v@�^�+ T@���T��@��#(���@�-�l�@�ߎ�x�1@�NĊ���@�4
�Z7�@�� 
�f@����̶@�	�c;r@���?�@��*@��$x۩@�%���"�@�;�
��@�W�.���@�y�5%�@̢g�λ @�ќ_ _e@��s�@�"h�P%@�Ģ|�0w@�j��u"a@�il���@��"x�c@�sߢ��D@�)���E�@��v,�m@ա�9�D@�c����@�*��.@@����t
�        ?��:���@"$ ��w@APМ%��@S�u҈�@a��DI�_@lKgMm�@t@ok~2�@{�VHI��@��b��r@�ʜ���@�C7�@�7z1+!�@���U%�@���'��@��%�A7@��)��l@��fa��@�G�_�@��`�u�@�D##�b@�}�6>N@�1�T/S�@�p�}@�'�u��l@���q��@�(-FY�^@�ӕ6 ��@��A��@�c�J^k�@�S)�(@�!����@ꍈQ�!@�b�g��R@�Ugc�@h@�0�2s@�_bn�k-@�P�˖��@���n
�LA A�y�/A6�?\�A9��$��A�3'�A	,=�C�aA�&Ή
4A���֔�A޶\+FA��K���A���/>A��`ݫA��`�$�A�#t�yAa����A�8/��A!=0�r
&A"�*J�A$�7cMA%�'��8A''�6��,A(�,n8O�A*�YH�7}A,Y师�A.<g���A0�|
��        ?�x��Ĥ@,���Q�@O+'�|@dx�&��@t��Sg��@��Ƃ�
�@�Y�e��@��9�D@�y@�<f�@�_r���@����E�@�q��@���-��@�j��2-&@�v40	�7@��z\7c@�h�|ac�@�'7���@�f%�g�@И��8s�@�K�9�[@�Ry��N@ٴ0s�@�xtoh�.@�Ӡ�q��@�$� �^�@峁n�r@�X��ƪ@�V���@�z�A@�^�b�ŷ@�ej�v@���$��@��j��L@����Sb�@�>����A �ɔ!�A�.B�;A;,���*A��SF$A���ߢA��f�|A
�S�&A���ⱕA�۩��A�mf7�A�f�9�eA�)���PA)F'
ZrAy�q8�KAՏ�
�A=QD;A��9!�A-���YA�b�E|UAL�����A�ң�U�A ��˲@	A!����A"���y�A#x�%�,A$i�b�rA%aT�
n        @��5'�{@�R��A)	S�y>A$T���A2ގp�A>S�E��WAF9��k�AN���P8vAT$�� �AY���uF�A_ǜr�5AcKYfⷝAg
Z��Ak!�	_�Ao���ʟ,Ar/|xo��At������Aw|���eAzb��/�A}r5;o>0A�Ud��,@A�鴆KA��H�fg�A��l��A������A����)A���lQ��A��k>�A����`��A�"l�
�A�R����6A��.��)A���NS�A�'���JA��.���A��Tٚ�zA�iY}N�A��F+dA����s�UA�#iZ��1A�j'�hA�J7��;A�2w��DA�"��ҔRA��/@�A�:���/A�#�~3�A�4�\��A�L�pfUA�n�K��dA�����A��37&A��k=�$A�N��;(�A��a�e�A�{襭!A�-���L�A��o���'A��]���A�ao<��EA�'�y�sA���L��A�¶v���        ?��s�z�@%��{�w@C���Kbz@V�?~�?@d�"[��r@pp��)�@w�,��`@�[[0�@��'Z t@��?�^v@�c[n�
<@��3�q�=@��f�e&9@�W[�:t�@��8���@�n#��@�|^҂�@���BPW@��!�~y@�YM�C�@��˻pd_@�vq6�@��0��Nt@����c��@�n,E�t�@��5�ȃ�@�u6�F�@�����@��z��/@�N���M@��,#]0@�����g@�F?.[�@�2F��@�%�k�;@� Y;zA�@�#�(�J@�-�N�A�@�AW�|�@�]txH�@Ȃ�����@ɱP�&@���"#@�-h�`H@�|(� �X@���U!hN@�L��@���R�(�@ћ�T�T@�e~-��@�7f��>@���o�@����{�.@���@��U�5��@���F�0@��|�k�@��<^s��@�M�PC�@�B	S],_@�vٛ���@޶�h�@� �:d�        ?��1��[�@1D�L�@V�����@ppX}V�p@���N�t@���)j�@����e��@�_N��G?@��VuZ@���=�1@����(@�W_��nD@�9-6�m}@���H��@�һ��@¦�=@�_m�vH�@�Hƪa�@�fX��q�@ο�?o�@�0m�FB+@�+��)�@�Y�涇@��j�Ѷo@�p���7@�jJ�`�@�\[_)�@�2Hpd�@�;|mu��@�|풮��@���VX@���Q_@��5�`��@�ڡ�@��6"{�@���0���@�00����@��&p�@�Sd�é�@�A��K�A9U%�8A�Ud.�A�w����A��:�A	t`���AfK��\MA�ץۜWAQ�j�ҕA��g���APw���A�vQ&\)A�pV�WA�� o4A��7=LsA��F�AA�N��@IA �|�UGA!��t�FSA"�BptA$A�?sVJA%����0A'���A(z*�dvm        @	v���+-@;-u;��@Ws�m��@i��|��@v���8��@�I�����@�?c~�@�5Y�`�@��g����@�9�bAA@�T��@�a9����@�o�^ae�@��SxB*@��:�1@�����i~@�� !8�@��`�K-@�[�2/�@̕zd�RR@�a��m�@�Ұ�Y@�8���5@�J�vK�@��fL�3@���U|�@�t�5�w@��Ԭ?@��cj3@��%>�@�Ԙ@��hfR��@�2n� B�@����d�A��gA��(5;A2�OV`BA���Rl�A �|f?A�Ĩ��ASa���Aы��)Ac�)'�A��б7A���_DA� ���Am�1��Ac2CyJBAm�s1�A E�8���A!_x�d��A"�au���A#�}�w�A$���WA&,=�-A'xgF�}�A(�ͷ�
A*/?�$�TA+����ƥA-G�2A.���¤�A0
�拡�A0�s�        @�Tn+k7A
7?s�NA'�]����A;�\S��AH%H%��AR�֞#�AZF 崐Aaf]��#UAf� �\Ak&����zApP�F�AsBF^��Avf̳�!xAy��6�
�A}I
���A��s-�JA�{<y�5A��׏��A���J.�tA���KYA�V2�AhA����tԂA�)v�MFA�y�|�F�A�Ֆ�s8A�<-EŠA���*TA�'���A�����A�7����A���g%A�n	e��A��I���A�f lm�BA�E�_;��A�+MG�kA�nE�6A�	D/n��A�V�b\A��!m�A�
.���"A���qA�1�A�Q��@�A�y�rm��A������A��Ӣ@�sA�+�$�&&A�=_;��A��#��Z9A��_ޠ��A�TC+xRHA��"�DA�ճ�]��A���TdFDA�p�*��A�G?Rt�A�%s���A�
���*�A��-�sq�A��mЃ�A��"����A����J        ?�׋�+V'@ X-��@6_BJ�yw@I�r��3�@WH�ԫ8+@bl5��~�@j���iy+@r-�W�$5@w�]��4@}���m�@�]�ؖa@�"���@�A*PI@��ӣ0�5@����Q@�d�ʰ1�@�1,G��@�3(��@�q<��6@�x�7J{�@�^
��@�j�^�o@���\��@��ZjՀ@��V��}@�:~�!@��Jj��@���s�@��v�9�A@�YX��@�y�}��@����H��@��a���@���b�@����[@����7�@��Ҧ���@��t����@��s^&w@�`wpt@Ƭ���t�@�x�v��@�f��_S�@��C����@�J�Jl��@��]d�@�X�3�$�@�wv�c"�@�G���r�@�,]S@��k���@���#AbE@Ի��e��@ե�NT�@֕��ͬh@׊��h�X@؅�ܫ��@ن�;_қ@ڍ��ݷ�@ۚ�J���@ܮb���H@���0L@�����        ?�EsDM��?�� �z@�/k�@-��)%��@;��Q�I5@FM��ߡ�@P����9@W�����t@`���؉m@gC��ǋp@o�F�C�V@u�tz���@}4���|Z@�q�iI��@������@����!g�@�Y�Z���@�f8�@���)��@��Y
�@�Ṙ}�[@�sKWA�@��Vud��@��f�}_B@�����g�@�G-��	5@�3Y�o@���F|;@�&J}�Y?@ˏe�h-�@�F�5��>@Ѩ,|�]@��<���@�2]�`�h@ػ�s']@@�u�xi��@�b��v�.@��c]m�@�o��Ϲd@�:C�²�@�#��|�d@�-1����@�Wߩ�dJ@��f�D�@�7)s�T@���M}�@�25���Y@��d�@�'\��~@����
@�o4��S�@�3ש��@�87�@��M�CA |�,AZ�˴XA6��=e�Ab�n�TA���+�A� �BA8j�` �A��z]�A
�{S��        ?���I�U@,bYZP��@E����@U�k�(�@`˩��x.@h}[T�@qc�y�Y2@x��g���@��ax�S�@��>��@������@�uM>�@�Iᘎ�@�.�g�X@��lR��@��3�*�$@�i�^��@���7�@�neY@�A�yl�.@�<<L&�@��1{hd�@�=H�D�:@�؍���@��2�TR@�M��>@�F9��Q�@�t{f@�/g�N@��ei�=@����̈́�@��߈̴A �=0�ңA�\�A�#С��A�S����A�oĥAO����A�D���AMl	�A��e2�AJn{=�A�\���A��AC�.Agɢc%AGQL"`�A<ff���AF��A 30�4w(A!MB^*��A"q{��J?A#��'`b�A$����A&�ڢ�}A'd����A(��S�ZA*�����A+zKV�A,�Y@ɞA.Y�* �A/�L���A0�~��A1m�8�        @�/�HO�@�&��;��A��I�
A���kA':�!&A1�t�H��A8X�|��A?�pi��AD4o�pW)AHɨ]�ôAM��+�nAQ��4=��ATYH�AWZ/6[	AZ��0��.A]�<ƗհA`���G̈́Ab�����Ad|��ě�Af�9��� Ah�����Ak
��paAm}/o�%�Ap	al���Aqe��
Ar�X�njAtR9P.��Au����TAw����W8Ay3���DAz�d�+A|ƴE��A~����A�Nf>xA�PW_u��A�[�4iCBA�o�{.�%A���.4�DA����ӅA��28��xA��&%&�A�V;ݹ�\A���x
QA���(��A�<Er.�A��q�`}�A��B�ӽ�A��j��A�f��5��A�!�|A����n�+A����#�aA�k)XA�7B\�bA�M�_RHA��<.HKA���08�A���M�/A�~P��B�A�iVK���A�Z�I���A�R����A�R[����        ?� A�4�@!]�A�@-���5�F@@�&��
y@M�6�A��@WP��L�.@`Ҽ&(�/@g��6�@nO���@sa�S�@x/�i�9@}�H�/'u@��(f�Y@�,R^w @�ݫ~8,@��!b�@��K��+�@���7a@�u{��h1@��N�y@��~@l%@��m;]S@�5Q"*��@�����δ@�:*k�e[@��2���@�qZ�o;�@�!7)�p3@������@��V&5�@���M�`�@�f��d�@���Jz�@�����7�@���c�@���)"��@�����I@�����@��S*�@���%���@��9�+f[@���@ m@��1Y��@��^0@��&��@�l�T�<@�*c�ܪg@����d@��e)�A@�&�𭝣@����a�:@�6���5@����4�@�L��(g@����D@�k��Q;Q@��We��@œPF�P�@�*k��.�@�Ç�g�@�^q�y�i@���Ɍg@@Ș��F'�        ?� D�mS�?�[���@�B-���@3�q�=�@Di)�1�@Qg>��P�@Z����O@c6̀ڪ�@j���3�l@r0B��B@xx�o&��@�S��e<�@���+F�@�z"6G@��d%�@���e��@����?SG@��4�M�b@��9���@���Ԯ�e@�V�	��@�[�&��@�=�g@@���"Zb@�
�1X8@Ǌ%�WC�@�i. ��@ϩ1?�cS@�&���7�@Ԭ��e<@�i�AX�@�b��-�A@ݛy�g*�@���7 3=@�qy�"-)@�~��})@淿#2�@� 90�t�@뻼-�s@���w�@��6Z�Z@�rF/ټ@�7��0��@��P�TL@�(�v�@�V�@���@��@�fM@�$7vA ✊E�>AG}�ޓ�A�@`,�AP�
s��A�A���*A�z�0�A
���� At́���Az�P3mAMS����Aj\�<�A��z$��A͕���zA�l�+�Aj�%2}        ?��Ǟ�T5@!A�ӛ��@@�}��2@U&��s@d�U�*�k@r/n�Z�5@|شmFb
@�{�����@��'�/��@��vU��@����?@��Vv6��@���ڧ�@�G\�v��@�Qo�%�@��xܽ��@����&7�@�V��c�@�����@þt��J$@Ɲw�\@ɶ��7�+@�1����@�Q�ق��@�=��s��@�M�tvM@ւ݅V�@���=u��@�j�:�@�$.v���@���[���@��:$̂@�ʗ��X%@器ž�@牱9��
@�R���"@��;�n��@�0>6��@�Z�V�{@�jtX[3@� ~s]A@��"����@�D���+n@��
|��@�Фn�@��Y�u'�@���0��@���;TJ�A��h��AP�����A�Q�p4�AߒR�.fA;Pj�GA��¯#A	gQ�T�A
��O�u�A'�;���A�C�?FAa��X�|A���CVAbIv�"AB(q�A'��	3        @��ڀ��S@�;�d� �A
�%wt�A�fIvA$�G��A0��rA7~�[�A@9ش���AEsN�1�AKhZ��f�AQ	� ��=AT�8(�`AX���EpA]�� ��A`Ё�>�5Ac=
9�]�Ae�}=���AhioM�;�Ak"�����Am�6�$��Apg���6tAq��吣aAs_�~ɂVAt�*�֬>AvuW��Ax	����EAy�K�g)}A{C��CB9A|�m�b�,A~�'��DA����<A���.zݧA��>�SM�A���>$�A���UJA�cKJ9DA�@�����A��A�`(A��j��A����JA��BM�vA��xa�A������A�cM<���A�F��.�A�*��یA�ViyM]A�����^A�ڏ���A�`�o�D�A���F�yA�Io��N=A�����W*A�5tp#A��C8�p�A�$V��-�A��c��A�y� KA���s`��A����A��׎�A8A����c7A��d�X�         ?�,�!@�7�_�X@$�aޯ�\@7��h���@E�GĈ:@QM�_�yt@Yx�Jԃ@a�E�x`@g����7�@nV�y���@s
��C�@w`a����@|(�Va��@��`���@���)q{�@����f@��^v,�@�Q`W�A@��F�l��@�w�s�W�@��BGۭ@��w}&{@�{��z�@�nXg�P@�����<@�K���q%@��z�{DK@�,��� @��*�J.@��Z<��@���@4�@�92���2@��Z}�A@��J�yH@�G,�Z�[@�9	v�@��k�2,�@�߁�h�@�Ӯ�1�@��6��l@�Ȕ���_@�Ȥ_r@�@�̋!�oJ@�Ԛ.cj�@��;+f��@��� �6S@�	���@U@�%���Y9@�FĤ�@�mR��@����t@�e�D�@�@����b@��=���@�H^6	�@����e@á(�&V�@�W��7�@��gCo�@����@ƭmґ�@ǊԾ�-@�t��)�l        ?�+��x?����(n@�����@���0@*��:�K�@8ȱ��.�@E�iAn<@Q���T�9@][����;@g|I�gh8@rd#�PO�@|"����T@��a�OO�@����y<@���A��D@�	���i#@�`-�У@������@�����j�@������@������@��K����@�.lp��U@���c"@�HXh�<@�k9?��@���+��O@�ص�b6@�&�_=�@��5T��@�x��.@�6?0+�@�#hip�@�@b0]@�Ev�R*`@���bU�@��f��@�����e@����g@����!�@����`@�Q�ƶ�oA \�S;�uA�[I�C�A�
ی�AAU�q\�A�7���AS���CA�}u��A
�ϴ(AeKSnvA?�c$ЎA�vZA��+�?A(��Z�bAAG
u�Ad�.�C�A��{(�A�^�M�A�HXA\�vz��A����&�A��        ?�� ���@ѐ[���@4�W3@E,�ha��@R=��e��@\�L��@dAʤA�@l=5��@sX��i�1@zO�s�@@����)@�.^�B�@�YV�.q@��xU��@�{ŭ��@���]��y@���"Jco@��mL��@�t�gi+0@�5�i��"@�Y�4@�Iѩ؋@�䉊��}@�m?*a],@��[6v�@օ��*��@ڟWUV�@�85��=T@�*|eA�@��O�q�#@�!ox��@�k{y�]@��A[u@�q˯��@�|�ŋ�@��o=�8@��l��E@�C镻�9@����:v@�;���/wA �ėU�A>(�o7A�EsO��A��7� OAa�^��AΙW��A	@�K'��A
��M�A4g���A��1uJ[A=�?��Ae5́iA/	�1QOA�-7�o�A̽rO~�A���p�
Ax݊ˍ�AU�0�$A6:Q�'A(�~�0A㪨2�A��$޾�A��bF��        @��F�}��@�"-���@��%�AA^"Ɉ@A�0�WG�A!2܊��A(�*�lA0��x��A5��0���A;��T�*AANs��AD�~O$kZAHT��k�ALer)X �AP]8���AR�a�~�AU�BAW�O��ZAZj��&|A]Mw�c��A`-%F�p�Aa��f1�Ac}��h�AeIJ�Y(EAg+�b��Ai#ݰ��'Ak1�&��8AmS�k��TAo�#���Ap��?Y�Ar��U�AsO�� 3IAt��8�,�Au�1¸�Aw2EkJ�cAx�5����Ay��@�yA{s�]�jA|�(�A~p_��+A���{]TA���:!7�A�z���A�=���A�i[b�A��-R��A��7�9��A�f0��`MA�<���QA�_�G��A���Ee#wA���YMA���*���A��xkB�A����|N�A���7�j4A��#E��,A������uA��{`L��A�e�|���A����2�A��n���=A�$#2� �        ?���S�%@ϰ����@+���:�?@>j����*@K	Xi�^;@U7�u�	�@^��x�F@d��WjT@k���d3@qVL҉�@u�����@zN��,@e�n���@�yxD�1�@�|nX@��eq�4'@�8JQ%Q@����e/�@���+cp@���^�@�T�z8VH@�����L�@�6��E�J@����M͐@�Q3��$�@��.l��L@�O҂��@�넪j�%@���B���@�]"lt�@�36ǃ@���@��6��N@�By]�@�)ol��\@�G30�N�@�o�4��@���d@�@���V�@�/o{��@����x�`@���Kcy�@�_=����@��
N8{@�l� ���@���|u@��&?K@4@���A�_�@�N)Ei@Å�y��$@�ye��@�uU._4�@�yT�պ�@ǅN��x�@ș#��%@ɴ���Ā@��빴Y\@�����0@�5u�}y@�n�B[o�@ϰv7\ @�|ò>�C@�%%�LϦ        ?�3���.@>��F/@3�9ҠM@G�LO��@Vo�)�^@b����@l1(ͤ��@tV�[#@|P����@�>����@���,�n�@��b�@�1���Y@��>��@�uC9��@��b��v@��PP�ŝ@��ļ��@���:�@�R3����@�=�,Ȓ�@�͗.P.�@��낶P@ͅ�k��1@�_���n�@�K(�##V@ׇ��Q'@�w��@��O��@ᛕs�އ@��@���u@�\/]�@�2��LR@���� �@��a�T�@�	��fe@�++7��@�x�B�=@�{|�BWq@���hc��@���Q�T@���*���@�]�<�$A ��}�AP`=�S�A��5�AB�#!��A�T� ]A���5A
Y��AnA=���=�A<���s�A+>|�oAF`86�wAp1�s�VA�Q�|�A�k)r�AL%�r��A�&�A3�;h��A°$���Ad�w��A:�\7�        ?�����`�@�Yq��@1m�s'@Hm�@�s�@ZN��7�@h3.}��b@t+#$�ԧ@��l�@���PJ��@�#�,���@�H��ta@�ډ-�T@���x@��p+*~l@�?^�lH�@�;��$@����U�@��yb�+�@���xW�@ϸcC3@�5�q@�����@����tä@�k	�ȳ@�6u�
��@��f.�7@��ߣ4��@�;��z�@�ư�R@�Mk�8s@�]l.�x@����^8@��1GVbI@��D�n�@�7��h<A ��H��A��r=vA9g�f�A�t�o�A���l�A�W�bmA
�k"��A�Q���*A�)A���b]�A�RJq�A�^�!��A=���A�:�2�gA�3�Z`A0�:���A��A�_�A_)ta<A�B�lA��"�A���}��A ��:
�aA!pM��R0A"L9���A#.�P#A$�ϵ;A%	NN08RA&Z�^�        @��>I��@�-K}�@����)p�A�gSB�iAX���B�A(CBR�f�A1��$&��A8��}�A@:C�g�VAD����AI�v�:$$AOe�1�rARо��AV@OZ��AZ��h$A^''F_?�AaT�x!��Ac��â^Aft���dAi[�e��Al�ⴻf�Ao��O���AqԈ,��-As�4����Av˫��Axk�:Az�Z2VFNA}��d�nA�V^8��A���M�A��
��/UA�L=�@A�!sZ${A��`�tA�/,3A�7��0�A�v&���cA���W�7A�(�c�/A�wX.� A���ӱ^�A�C���*"A��1�/��A�Jp��$A���C/�WA��f��03A�4�^���A��+�7�A���T2�A���PMM�A���i��A���ά�A���"A�|٧`��A�u1ژ�0A�q:Sz�A�q!�A�uA�u
W`�A�}0� A��/�HA��}���A���a��0A�¨]��        ?�GΧ��@"��f�@,j���@=� t�T1@I��Vn�4@S�mCE�@\A�G��q@c��W�@h��H�@om�9�J@se�zi�@w|��%�@{����S@�w#^�F@�&+��ڿ@�8cs@�+�wF�@����M�@�j��Z�@���Q�̽@�����l@�����h�@�5,�s9@��:�D�b@������D@��o � �@���v��@��7��I@��<�;�@�|��<�@��A�L@������n@�Y5'��J@�Yq�\@����M@�����@��=�o'�@��r���T@��h~ld@������@���ּ�2@���g�@�ҕIJ�@��34j��@��@���@�_����@�A�t�@�k��� @���Qe`@��M7��u@�?�[�@��.��<o@�K����1@��+����@���(@�F)�-į@��T��.@ģ(�<K@�T���+�@���3@ƽ"�	@�s����@�+����r        @
A)�}�@9�$��4@U�W��f�@h��Z�@wbt5~@�G�U3�@�J���w�@���ݑ��@���&�*�@�k��C�@�Sy�N@����-W@�U��޳�@�8Cg
�@�?�q�@̒�[�� @�w����w@��,h@���|�X@�i,Hq��@�ć�c"@�o�$��@�vG�*@�t0�v@��0��@��ĸ�G@�����@��;R@��nU�@�Q� ��@�ʺ
�x�@�s}r,��A '�=S�A����5AV�yhA��DA��;*+A	�/+�A.)�qA}TE���A�5��(�AJw��A���W�A.�wq�A�5̀Ap���6A7�|=N�A����Ax+.`_A(��S�A �c/�6XA!ѫv�4A#2��/{A$C����CA%����ٲA&�"�o��A(P����A)��*���A+D�@k��A,ҭ�IA.n��F�A0Ǻ�0�A0�ƿҡ[        ?���&;�?�3\�"`�?�]h��@�$Ǌ�@'_n\i�@7�J��=@G^ͻ뒤@U�_fOߚ@c��y���@p�4pN�m@{��c�0}@���o�@�>Dzm)�@�l&Bo��@�Kr/R�i@������@��[��~�@�_L:i@�������@�6�{j�?@��S�S@�]�I�g@�G� a@�,|f]�@�_X�[��@�����;@չKK,m@��*��,M@�FI��8@���HKa@�.3���@�c��;y@��m�`�@��o��@��S;0@�����E@�x�@�zY�ſ�@�|w(%1@��%�6@���!�@�_�㯪�@����<LA ؃y6��AIϞ\{A��LE��Ad� ���A�i9ëA�%��-bA
�6��d+A�t.��8A�(�`�Af�B֬�A�uvXC�A��c�}A�B�A}AA���
A�8E��7A
�[<�nA��iB'A����cA�"�?UA_�G�/i        @�o�Y>?O@�E��F�A ��J��CAA(�T�A F
�rJ_A)�$�W	A3�;ZiyA:�5V�;AB}w��AG���k�AN�h��ASAw2AW̡T��TA\����AaR�`�Adu��f3<Ag��Sx�Ak����Aoq��p��Aq����eAs�<�-Av<Q2��Ax�?.�>A{p���A}����A�$��6KA��Ǣ-�oA�쏼YtA�`�׈�4A��S�ˎ|A�g�jܠ�A����R��A��@Z{p:A�9��Ju�A�竻-UlA��2��1�A�������A���`�ؼA�{���9=A�i5���IA�[�\bj�A�S/��_A�O�n��A�R�y/�A�Y�v`�!A�g=h�A�z�P��HA���>ȜA��Z&�I�A�؞��IA���Y�KA�| KA�������A�Q���3A��H�;A���:�A�5�Zg�A��
G��A��)���A�'X]<�A�� |��A�y�=k�A�%(��2        ?�8d$h��?�z��/�@J��PwS@$�#��@3z :�N�@@]1{��@I���>-@Q��⚣�@X��^%%@`5�(���@d�G��@jq1I��@p
���@sr��K�@wA�-�=@{wA��@���](�@���j�:�@�6}3��{@��W�zA@�#GWB/�@�c�N�6@���@�p@���]@�@����'��@����>�@��,Hf7@��C��#@�x��ѣ�@����O@�?s����@��+!H��@��z��
@�a�U��]@�ڀk�)3@�_9C�nZ@���
"c@���W�)V@�<f��@������.@�_C�۟@�I���@�8t٤��@�,�*S�i@�&����@�$ua�C@�(YL�˛@�2��@�A�*xc@�W��7`�@�s-���*@��t���@��wZ��@��r	���@��l3�@�+ެ��@���,ƃ@�q( �d@��y���@�ȑ�R=@�{��(r@�3��x�@����K*~        ?�>�B�?�)���J@hBp��@/�����@>u3h^@IᚡV�1@T��J��?@`�6���@hm��%��@r( c�@zx��m@��{"g��@���W�b@�4����@�}xƇt@�+ CX�@� '_�":@��-��E@��_�bѥ@�9�F��@�=j��I�@��^Қ�@�|�b��@�n�*�h@��px�6s@Ѓ���>@�^��cXA@։�r:��@�d���@���}-��@��.Q=�:@�7H��yW@�W��M@�+mhV�@��q�b@�ǹ�hP@�jgM\�]@��<�,z@�Ύ_z@�y)��K�@�O�Υs�@�7�?�@�0\�)�@�9�Ƣ�E@�S�B��XA ��~�A�"���A��AA�J�A����{hA�0u�%~A1�rP(A	��t�A���X�A��U<JA4}m*}A��:a<A�HOtL�A�Nq_%A���>A���0nA�$��A����e�        ?�3���u�?�1b���@��$��@'o�G";@8կ>��
@F�ن���@S)�����@_�C�w�@h�Hu�!#@r�y��@|���lo	@��䖜u@��6�/�D@�����@��,�6�@���{F.�@�(�1kj�@��}�@�|�J�@�;�����@��c	�I�@�Jh�P@ŽQ��3@����@΅��z��@��~���M@԰��P|@�Ϣ��BL@�6u��J@��ú���@�q*����@㕛c:=�@���_�N@�Xg�X�@��#;8@��h�<}N@�i~L2�d@� م��@��jjjH@��4m��@��V��d'@��~B��Z@�!�6 @�����{A ��P���Au�cA�]��NAL��U!ALZ���A�C4A
�Xe��A��s�cA_g=��A�L�vaA&���55A{j�)�A�'�xAW���p�Aހ�ixAu�(�Q�A����A�8RO��A��:        @�'R<�p@����p�(@�E���\@�(���L�A�\�|�A��K�k�A�3��9�A$�W֎A,�P��lA3�0�~A8�K��;xA>�h��
ACH�^o�AGU)ʥ|AK�v���AP(���'AR��c �\AU{�ϖ~�AX_��#�/A[eNf.�A^��Ť|�A`�d �(Ab�JYu��AdC��u?_Af��p*Ag�1q3�Ai��g�bAk|!�jo�Amc�
Q�@AoV`�^�Ap�k�ݒ�Aq��3��SAr�Ȧ��'AsΓ_�>�At�t>Z�Av
�A�Aw5���4AxiъH%Ay���֧Az�gC>�A|Cq8Yv|A}�2�wA	�Ұ�A�>�H]*A���W��A�����bA��.^�AA�_ĉJ,A�7��"A��a�_~A������A��{T�A�����A��j�(A��׳���A���X��A�֪�&��A���߭iA���h���A���W�A�_3E�/A��8Ey�A�@�n^�6        ?�m3����?� U��0@�Vx�.�@'����`_@5���q��@A�U��@I�8t��@Q��@�@W0*�c�-@]��j+jG@bg��ڠ�@ft�q{�@j�"~y�=@oҫ���@r�9���@uf8���@xq�dU�@{��b @ ��<�@�`�̀�x@�I*��ש@�H�� �B@�_U�&/@���&k��@�Ӹ�X�~@�22�r@�Th�4�q@��Dkd@�� ���@�P��=b@���@N�E@�8<5��@���(�!�@�X�0�s@�VVH�@��n	]@�����@���n��@��+���@����Pq@���4=�@������Q@�Jk�Ҫ@�2��a4@�pL�٢�@��
8;��@�"][�E@�x��m�v@���q=d@�l�Y��i@�}�8��@�K��f�@� ���@��!��w@�����@���6�@���V�ٛ@��WK@@��yP)Z�@��G�e�@�����i@�&`�@�;)$���        ?{��@��y?�zr��L?㮚	Y�@?�ɱ��`M@��i�#�@$�Xw�W�@4�'��r@C�C�:�@Q���G�7@]�)��k@h)��b�k@r���q��@{V���<�@�N�Î��@�V�L6�@�t���2�@��qV��@�����<@�+D�:K@�L�/�y(@�R	�W��@��6��ǵ@��z�@���y�
;@�4. �`@����(Z@�d�y�-@ƈY���@��V���@���=��+@�ԥ��V@�x�?\WH@��	�� @��bp	@���%@�I�U4��@�p4�ޣ�@�]zW�9�@�l���@�,��u@��j�ٚ@�b\�<@��K��#@���ݑG�@�4e�R�@�L�؜C@�%G����@��&�	��@�I�+�6�@���k@���?�+M@�c^#�@�2ZIʛ�A �'�&d�A
�H7$A~O�v��A�z!ma0A�B�A��&�=�A٦��A
�GCnHA	F� ��-A
�d^A1N        ?���i��?�7�3<	@ 4ݷ��@63���N�@G�O���@V}ƁB�@b����@nk$�
V�@w}�Q8��@������@��YT�ZT@�7���7p@�l�Z�v)@�fnʗ@�^�q���@���gQ:@��v/r8@�u��H@��ηU�@ú�'�3�@�
K���?@����Xg@�2#�܀;@�:6:xl@׍�ю�@�+���J�@���$�@��xՠ�@��r���@�8X�<4@����@�U�*��@���:Z@�w_@�6�@�����@�||Z�T�@�R����@����p�@�iY#��@�(����@�������@����@��p��|MA ޢ���A�ĂsA�FJ]:�A(&WT�A0{��)aA\w*�[�A�2�)�Aѥ��`A
�Zr�Am��4�AȂ[ڵ�A,����A� vo�0A�(Ȳ�AGIl�4�A
�2OYUA��%��A�#IiĐAo���]�AE1H>��        @�l��P��@����6T'@��t3��@���B���A;C��hAK�w�G+A�.�e�A �e�q��A%��@��A,	�S�I�A1w�3�A5L-�9q�A9��4�(A>�\FAAy��=bwADC��AFӅ�,�AI�h�ioAL��*���AO��T�AQ����ܴAS-*�3A�AT௹�AV�-a]�uAXk�5��6AZCKj`��A\&��@�A^���A`	i����Aa�ùE�Ab$�_��Ac+�a�6�AdFfH�%Aei�K3k�Af��ʼN4Ag�X9��'Ai��k�kAj^�f��Ak��:���Am����An�B�x�AphO�L�Ap�-�2ZAq��|ح�ArV!��As&SMh7As��YZH�At�'��uAu��&F��Av��7�Aws�?=|AxZ���ڍAyE>��Az3C����A{%��.A|�``A}>�c/	A~�3/֊AW��ZvA����A��6Yw��A�q�u�A��s�ʂ        ?�����D@#��G'�@?K�m�D�@P�g1��@]�Ê}�G@f�/�&q@pn����@vV�a߯�@}2�U)�@��&?sa<@��[��<}@��$�c&Z@��vEw�X@���#�@��N@��@�!�$���@���
iw,@��Z̧��@��zeca@�"ԋ��@�z�j�?�@����6\.@��aQ��@�bxaH@�*�u���@���g���@�b-�@� �&C��@����V��@��)�P��@���>�D�@������@�!���ѿ@�I�W�B@�~�z/O�@���2�@�:�G�@�l��#�@��|�ͱ|@�Sh��t�@��T�8_@�v|��T@�a���@���U�.@��hR6��@Ѵ��p�@ҥN���@Ӟ1#��@ԟ2
74�@թA!U@ּ��
�@����7�@���CN@�2����@�n9�@ܳ�P��]@��i��@�[L�ȯ�@�^ATֿ@�+>��^@��S��@≸a q�@�K[Ō�(        ?��NH1C�?���|��@0=��W�@-�F�?�@=�H_�{e@K4K9�93@W��Q@d]�D�8e@p�p���	@y�U�Թ@���@�d�N���@�	+�@����Uo�@����*R�@�_�e�Ш@��S�s�@@�����@�/4��4@�43�,H^@��ź�@�1�>���@���M(�@ШPt��@����ʧ�@�H.}�e@�J�%��@��aTmoM@�|l�m�@�aO�B7@��ֈjf@�H4�J>@�/Q���v@�x"��@�x�>@�ړ֊68@�T2j�@�~�2��A-�@v�AO�,�OA��`��:A;mj@3A���vA%X��A����LA�#˿��A�Au��A��Q��PA�����A�x��A,����A ��f\tA"����A#��GA%QYJ��A'�:�'A(��K�A*��Ӊ��A-
1���A/4WX�.�A0�#�z�A1��64L�A3 oC���        @e�ߖ�@D@��N<�@c="�@v��;Uru@�A����@��tΏY@��\�_@�l��8�$@����sЅ@��R�	�@��Y�@����v
�@�.��V\L@�@�5��@��o��@��o㝴k@��郖
�@��gAA�]@�s|F��@�g`�yF4@�|�L�#@�C��ޯ@�
g�O��@�J��@�a�;��M@�Gj���T@��@��Nh@���>L�A 
�L��KA8���sRA�^�z�A-��6�FA	����JA���e:A<�"�A��}��A�৸_eA2c��A�=�1�;A�`H�A��;AAA�x�%A ]p���A!�
�g^A#�o8t/A$np��nA%��6�A't!�-��A)��TA*�|�Y�A,�Ɓ$�A.X�}<rUA0#J�A1%��F��A25!��P�A3RJ.�aA4~Y3!A5�C�e�A7�4�6�A8a��uA9�ʜ[A;Ng�ɐ�A<�;����        @����V�@񩬜��AM{L���A"�w�M��A0�C&�r�A:�d��TAC(�;���AJ���v�AQ
(f��AU���AZ���� A`9Q���Acb�v^9Afؗ�Z��Aj�\P	An��ہ3Aq�3���As�N9�AvydZ��OAy4��ܝA|"�E�=�AE6��4�A�P(��1~A������A��<���A��\��A�L�{��A���{�5pA�<���4�A�~r���A�����_A��$����A�;�䫅A�k�t<�A����WAgA��_b��A�!K�ŗ�A�h�Uw�A��]�A�+o���A�~�X@�;A��w���8A�Td���?A�׀"'�A�kЈA��%�A��Pp;iA����A�0����A�%j��v�A�#M�fWA�*�+��A�;�;�{LA�WFDD�A�|�j�Y�A��E��]A��Lg>9�A�.4��p2A�!�A��6�/�XA�B�^��A��h�*(4A���a�	�        ?�Pv�t�@��,�^�@5��YE�b@H8Ve�w@U�|�N�@`�"6i< @hZ�v�@pX"�ʣ@uC�ö�@z�k�S/@��($�d@��k�3�]@���߭�@�����0@�����`@�n���e@��a�!?,@������|@�cL�t�@�Q}�^Dm@�0���y@����@�rt�@�+{�iY�@�����N@���N�]#@����_�w@��'s���@���:Â�@�mNr|L�@����f;@��8K5�>@��4�06@��)��@�@Y���p@����
��@�����@�6���>@���)��P@���%�@���&��z@��2g�w@��}�p8@�������@=1I�@�p��(q�@�Zl$Qc@�Km�_�@�C��h$�@�B�=_��@�I�7m@�U]nrU;@�gk�Kwp@�~���@̙�a��+@͹%쵓T@��u�j@� ?�Vk@Д'���@�(��ˆ^@ѿ:U}=@�V���s@��K��        ?�vG�_��@a�Jq4�@%8 ��@9
N3	�@Gn�_�}�@Srm����@^�#Rr@f�a	
�@n�˅s�@t�1ѡW@{�YYW��@������@�h˳xƔ@����_@�c�ގ �@�e��>�@�$���Տ@������t@��2���@�۪�-V@�&~��@��W`0�@�Ĳ!7��@��?�8#@�SU2n�J@�.�YQL�@����9�"@�͸s�C@ű�d- @ȉ}��p�@ˣ��h�@�v����@�R���%�@�H��T�@�c��6π@פi��@�?͠��@ܙ�{�3�@�P�r���@��}���@��8�@�9W��[@�����C�@粱����@����@�Q7���@풘�]�~@�_�7��@���3b@�#8e��;@�Y�}0�@��L+"��@��܎�@�L�x��@��ǆ��[@�4�'��K@��鿋��@�]���@��$R�A fߑ&f�AP���7�AD���AC+|>��        ?ߣ���(@͜�k�@3�} �Q�@G�A侦�@V�E��N@b��t �`@l��֌Q�@t�O����@}t��G�@�4^��@�-�^ӧ@�����@�o1Г��@�\7���@�O�U(�@��Gpͳ�@��`j��@�/Qf/�%@����zu@���+��t@��;�c[)@���2-�A@��3	�*@ɲO�*�@��E.�)@�$��}@Ӡ�3�@�X'Sn��@�O-�Z�@܇���o@��R��@���-3^@��%��an@��0t�@�k�}��Q@��Ia�@�aB�Dh@�9d0��@��!p�@�a`"�'1@����d�@���m�}�@����ۓ@�_9v@�M���~@���>�6�Ah�MAv�����A�����Ai�3MA��1&A��48A
��"�Ac�d���Aa�RA<^;�AU�Q:��A}W��%A�'���gA��	�AJ��u�IA���&�wAk�4C|        @����G@�y���WAwc����A<�ZH�KA'�(r��,A2s\�[�A:#���AAA~�3���AF~�ifAL,KnAQQ_�9�ATs�]Iu�AX�u�A\°��A`�;���Ab[a��,Ad�/ �]+Ag@�'込Ai�XM"Al�����Ao�2¢<CAqEf��qArӻD�uCAtp��Ml"Av����Aw����!
Ay�&�C�A{w�=0ɟA}_ފƞiAXWR�JA��M���;A���^�A��I��A��t�@��A����5A�HF��A��^F��TA��:S��A��YUA�l=�lweA���O�}wA�<X0�/�A����Z�A��24	QA�c�4�5�A�1&�� �A�{�e�A����,W A���x�؄A���0L$ZA���G�?%A�z�n3A�m�{K 9A�d�
�A�]���QA�Y�^�גA�XMB���A�X�qeKA�Z��f=dA�^����A�1��]A�������A�8&�%YU        ?��&�k?����Um@��'g�C@0ʈ��e�@?TU�,��@I'�$	0@RYu���@Y���/@`sl�J�\@d���U��@i�w���@o��!�@@s(-ÐOj@v�1�(@{�7ź�@��<��@�|����@�R����@�fr��^�@���G��(@�PN�x��@��0A�5�@���P;�@��"o�Q�@�S׭S@��80��@��O*j��@�>/�o�2@�Æ�N@�^/q��@�OM~Z@��M��O
@����`�\@��&��@����+@��+8��m@�|��n�L@����᯿@�վ�t.@��c��@�c�	�v@����r��@�.���@���//@�A���B@��z�s\-@��h
m�@�6f�n�@�&����@�!�0h�n@�'L���q@�8S���j@�T��L��@�|��#��@ǰ���@��
|�,@�9��x�h@ː
#��@��9�E@�aB}��@�ܑ��1@вp"��@�}Mm��V        ?��MM"w[?�'��?��d߉��@��&,�@3�-|@%�9S��@441dQ+1@A�)�،@Ni�I�@Xk+-��@c%��I�@l�ǃ��*@u7a�O�Q@~�9%�\@������@���^�3@�]��a�@��N��؝@����F�@����&��@���q@��6��y@��zs��@��N^|$�@��ܠ��@��Z�y�f@�!k,�^@��b˕>�@�o�7;�@�=_D��@�Pm�6�	@ͭ�g�_@Э2ȋΪ@ҭ���܏@�ړsV.@�6����@��ؼj�o@܅n{�@�|�L��V@�W#a�$@��Y\lS@��]䤩K@����`ž@��w��q@�4Qtl��@�$��T@���&#@�k%ԑ��@�ٱ���'@�]ʱc/@��[���@��EѓP�@�r���R@�S@d0@�M*8�	 @�aS��/A ��=�=�A����A ;N�
Ab=���aA�����A��C�A����        ?������U@ �yB],@APd0r��@V���@d���~@pw~NN!U@w{�a�,@~���ϡ@�ֺ�괾@�*���B@�BaN��@�:��f%@������@����]��@� �W�l�@���6J
%@�Q����@�ËֳM@���@�@��c���$@���o��@��9ֿ*�@��gX���@���[�l�@��2E�@�g �q��@�+e�o��@Ѣ�@SC�@���4�>@�N�)�@���s��@�ث�@���}���@�6����i@���i�@�۠Q@�T��w*�@�<�`��@�Z�9�+e@�1"x��@�!��_4@���gk��@��(�y�B@��3w[��@��R��D�@��Ԭ��@�'��K�@��!p�;A-=JGzA��
|FAH���A�&���Ae�8�x�A	.�G��AT��>rA��9�2A$a�~|�A��F��A�:�eA�֯�AF ��0A����sA�o�`w        @��CV��@�.ۧ�x�@��7��:A�kn�"�A#>��#&�A/+�%��A6u��l�A>	���bAC�\��AG���n�AL0���h�AP�l�+q�AS=X5t�AV��'AY�%jv"A\>����A_��ղ�Aa�5��H7AcwѕtAet�y�{Ag�:q��Ai��%Ae4AlK�!�-Anq��e[BApv��1`Aq���ٵ�As�DS
+Atp���1Au�n�V��AwN�l�Ax�{e��AzZ�!0G�A{��B�A}��n�x�AMF��A���5��A�pz>�bfA�a�p�SA�\RxQ~�A�`��(�*A�o����[A����A��n��<�A���Q�ejA�!
}s��A�mt� �A���~��A�-�h�TA���d�'�A����5�A�X��%.sA�&C��͏A��X�2�1A���t�[�A����9AA���L��iA���,A��A��ΗC3�A���p�~HA������A���ACR�A�� ���A�篞Xh        ?�I�Z��8@/8��1@J%`i�@@\��W@i���+�'@s����:@|�%sq�@�N���PS@���~��@�f8�t@�6��81@�
�4�@�*C�n�F@���JM@�%�x�l�@��2[�z�@�K�A���@����Q@��s��@��F�3=@��})ע[@�KX��@�$�
@��ʆ�zZ@��/p� �@���d}�@��� 8��@�� �ak@�_`�b�@�sd6]=@�����@íf�Jqw@��c{ >@��
A��@�)��,�@�[��=@ɏl�c@��0�\�)@������g@�6&Ao�@�p���?@Ϭ);���@�t���6@�	�R1B@Ѵ���@�V{��m@���{ê@ӟ�{�-�@�GJ��U@��d�{7�@՞Кo@�MW:`~@��JΡ%�@׳�$œ�@�k �i��@�$���� @��b�	�K@ڞX�mD@�^X��@� W���@��]��Z�@ݪx��F@�r�=Y��        ?����|4f?�]F�}�@�%ɮ�e@$��=@?�@5���=%:@DR��	�!@Q�����3@]���A�@g��$�U�@ruG��Fl@{�֍�|l@�?Q�7@��Nl��@���,k��@����ql�@��a+��l@���9�@�M�
�7@�ta��hf@���1?+@��+jg�@� ��Ӆ�@�W��@����@�.z��.@�W����@���W/@�m�����@�CĦ�q@�N>J���@ޏ�aP�@��Y��@���ק�@��消�=@�za�(<@�P�&��@��=��%@�ec��9X@�S�R@���l@@���H�@�jj��}�@�<o�m@�,Y���@�;�8�u�@�k�q@@��./;�<A]��E8Ah�#��-A�j.��0AA ��YA�=���Ap��/AA
*�-�V�A�t<���A龠���A�B1�deA���A'�FK�2AT�[GA���l%A۬nސ�A6$�0��        @ �U��@?��A��@[�%%�@x@o���WN�@|�z�`�O@��'M)9�@�$\�͆F@�γ���,@�>��D�@����
�@���{Ɲ�@�
κP�y@��6�6��@���aD��@���Mk�@�����wW@��K���@��'\���@�&�f�$@�-��Z"@�[#K*T@ǰUn�J@�/�Ԩ�@��5�(ں@ϵ��U$@�`�2��?@� �i ��@Խ1E���@֗.��nC@ؐ��y*@ڬ�|�(@�쥹A[#@�St����@����`̆@�P1�&@���h�@�T\3��@��c]�q$@��~DAK�@�v[�@�;Bmr�@���h��@��䝆�c@�¯� (�@�7�@�rt�@����9"@���RQ�@�2BQ���@�2���7@��i}65@����wA �� �+6A����0�A���H�Ai�զ�A��ʉAd���,�A	����A
ǿɸ�8A�.�0�)A�0Щh�AY��^         @�jQ�(�QAD/C�A!5���IcA36*@���AA	�\�AJ]0"�TAR�d���.AX�&-f��A`&Tep"Ac�nt\ZAh����2Al��H���Ap��&�As-[����Au�E9�Ax��F!�4A{�m8��
A~���嵭A�����fAA���~�9�A�_�ƿ?A�)�NU9�A�0��A��<&��A�ێ�m�A��ץ�#A����*��A�;� ��A�P�t��A�-��d\A�M����uA�t0ہ�A��h,��A��V!�A�}���0A�M�r͜A������A�ֈ��ͭA� 'f�tA�l^Կ�IA�]o���A��H.Y�A��lq>A�Y���%A�bs� A��ܑNDA�b]э�TA�M�ڔ�A��v-��A��21w0WA�<��M�A���*:^IA��yn���A����a
VA�UC82�A�&t��VA��G1��A��� ��jA�����gNA�������A��M��)A�7���tA���ż�E        @:m6P	A@H\�[�4@c��A@tgL�:�@�p7}k@�Xn�s�V@�XO�U�i@�{\d�@�,
�ס@��@��I�@� �}N'@�C�����@���z��@�����)@���_��@�{2���@�BvS8̲@�>_��D@���<�d�@��=a��5@�P,��@�X/��;@�7A~]e&@���%�X@����k�W@��m��@Æ"`L�G@Ď��l@ŝ��dq'@Ƴ�]@V�@��,��@��"y=@�-棯զ@�o����@�����H@�$��v��@Ϛm��n@А�%��@�]l_�"z@�3�����@��<��@��l0�{@������@����c�@�������@�L���@�4^!Z�@�_/IЀ�@ەF,@�ׂ�Q��@�&���K@߄Y7�i�@�x	,,�@�4�Q�AJ@��|k��@��9|a@㑎xا�@�e��z��@�>�>�`@�ߔ�Zb@���'M��@�ᕽ%^�@����aO�        ?�B�|�NE@#��1?�@)�c�	w@Bt�T<�%@U�ҫz�@f뢀�ڹ@vˁ:���@�n?w���@�V��m@���|���@�)�|T7A@��C}U@�� ��@�`��5�@�.��pD
@�ǥ�n�/@�U�a�+@��B1�i�@���pt@�|���`@@���t�@�I�1��@� �\�@� �m��@�1�w��@�c����/@�kz�P̂@���nE�o@�S�"g�@�A>%	�Q@���'��PA �Tc��A�Yg�h�A�a���AH�TIG\A	�6hp��A�|~�,A��-��A����ǙA�e��(A����A��%���A%$L��6A���(?�Aܖ�s�A �+ $A"@�ߎ�	A#��N�ݴA%��.�A&��McrA'�e��A)\F[�-�A*��l��A,0����A-��^m`A.�B˿hA0/p�$�YA0�F��A1���x2A2I� ��A3��N�A3�߿߀A4z���'        @���&�@>�x�L��@X�މ>@j�IY
�<@w7`r|7@��'��@�`��Ƃ@�uxD�(X@�R��n�@�2_��f�@�. M�>C@����T�A@�o���@��J!
�F@��2�E@Ŗ�A��@��׹���@Єݢ��H@���U@��-���@�9��ȷ�@�z��~��@��Q���@�ޮDX�@��	JoWA@�5k��1�@��x�f�@���U��(@��`!X&	@� ���s�@��aS�Bt@�,�.Z�@����A ����A.�!$��A�����2A��y@#vA�m��ĆA
hS��~AN��KA��ì��A�;O��A��ٛA�Ĥ�;A6msA�=԰u�A��bǾAƷk���A��NF#A�f"IA ���%�A!�y�Ύ�A#NV�!?A$���n:�A&|�A'����A)3�E�x5A*�Ԩ~\lA,��4���A.OmP���A0%�IA1?�
A1��І�        A ����A1�� u�AJ�&��{A[P��<'�AfU��e�Ap'Xs��RAu��ho^�A{��ROA����8A�J�%l��A�Մ�5�A����y}A�o�Y���A�������A���<�A��iu:&A�/��,A�x����A��א?��A�Dc%�A��V�ݍ�A�.2,�(A��RG�q"A��^^_��A�E!up��A���@���A�+��\q�A����BA�;� @��A�����w_A���*�BA��Hs9*A�����sA�yd���A�xF%KgDA��WA�*CA����x"A��n/�s�A��4��0A�8w56�A��k:��A�� X6A�;��҃�A��RlK�wA�˨i}A��V�h�A�����A�P	���MA������A��e��AĹC`� �Aŏ27(��A�iW�w�A�F�����A�'�OQ�0A���0A��w���:A������A���zF�A̺�l�g�Aͭo�n�A΢7���Aϙ���        ?ʹ�sҪ@�0��&;@$�� @9Sq_�0.@H��9�@S���]�k@]s��aE�@d��T@T�@k㖗�aC@r-��\��@w��{�>@|�Wz�9�@����}�[@�1P�x#@�;�vk),@��l��@�Z����5@�Jg�0@����3�@�m�l�@��$��@���H��5@�	�`&@�A4��ݗ@�����w�@����\�@����tr�@�h���w@�!g��U�@��%.�h�@�.)���@�΍�� �@��X��=�@�F�� �@� ��y�@��ߘ�{@�ķ�@*@���B�l@��{N�'@������@�����@��.4G�@�J��4�G@ǊR��_\@��5���<@�%�����@ˁ�����@���`fC�@�W���<@����-�@Ъ�sr��@�p�zn�$@�;�F5|@�
��+LU@�޴�p�@Է�c�@Ֆ79_�@�z�<�1@�e�����@�X$�Wy@�Qc� (�@�Q�iK�@�X���P        ?�r�%�Bl@	]L��f@-���u�d@D�_�\�@U�|$A��@d6|1�5@qGn/8@{W +�?J@��@��X�@�}4�>��@�jc��V3@���c�e@�	��G��@�N�'C�@�Uxw}�M@��'�&<o@�g��祰@��ϊ�@����@�s�0��@�y�VC��@��|R�[@̡{i�@�i�Z� k@Ҽ}��[	@�L�2$ne@��`�v@�4`A�ץ@ޓV9���@��v�#@���f@�G7ن�@���,)�@�$��@��~:�E�@���'�[�@�z��:x�@�,zp�)@��#���@��N�U�q@���2�@�8�4}�@���s�GA Tj/`�Ae4���/A��w�7�AZĺ�ږA����G�A���=@#A	��	�T�A���ӛA��Y�8zA�e���ASK ��AaZU�&�A���a�A%[LEA��w�~oACK���&A��]�8FAí�j�A�:���A�2���        ?�`��ܣ�?��K��Mf@�'��k@.,����@< �ڲ�@H�w��@UU:�!�@b8~^�&@m�je�@w6	�j@�@�h�|��@����,�@��= Y�@����*}3@�m�f��,@�_�+�Š@��\S�u�@�5X�@s�@����  5@�*
��
�@��s����@�	��6T@��h�E��@���t���@�C��&�@��4�N�g@��+ª�@��d��u�@�[��ڭ@�\��nG�@��̈rg@ܢ#g���@ߛq^� �@�k*{�:@�+�^�@�E��B@���_�@�T�'�l,@��m�x�@�:g��ޘ@�u�4�r8@��{9�@�g��@���s?�@��(8�(�@�q�Ո�@�IxG~�H@�4�p��@�2��]^�A  �P�y�A/���Q�AE�h"�LAbd���A��=�KA�5��Q,A��M�BA�ޠ04A	H}_��A
����TA�VF0��A��VAw)��peA���J�t        @��yz^��@���CR�=@��U���A6=���-AD���ZA%@��&�A.f��_R�A4�eB�s�A:ډ� AA	2O�AE'�AI�X��sAO��A�ARqP2�$AU����^AY?��X4A]*��"�A`�JĶ�Ac
��R�MAe��1�FAh1�dD5Ak����An �Q��Ap���
�UAr:-#�|As�s����AuȆ��K�Aw�Uvv�Ay��i_�A{��7�A}�k� s�A�$㐿~eA�X�1(A��SO�&A��u�6iA�?{zv�A��ge��1A�A��W�A����ĪA�(�2���A��!�kN�A�l݅�l9A���qLdA��&�MA��j\�TA������A��坃��A��yQ��A��t~jn�A�ʳذ_A�� �f�A���6鈝A�ܱ��%A�.�M�QA�XC�#=�A��]�7A��k<f�A�	�g��A����#f�A�R�&��A��#�n�A��I��:{A�rB�        ?�C�HD�@%�cӯ�$@E�>NO�D@ZO�geɆ@hUW�RdV@sbܛQ��@|P���@��ϲ=R�@����f�@��0����@�L��ړ@�u�jBH�@�1�2�@��	���@@�X{��@��\�0 �@�I�I�|@���/�b@�Fl���@�#�� �@�*�N��@�SV�zY@�̼��F�@�{��^�@�4NU��@��s��@��^���@ɒr�7��@�k�7V@�KB�E��@�0I�>@ЌS�l�@с�8Ə@�x3;�M7@�n��V�@�dM����@�X��I��@�K�0.�@�<:&�	@�*�ۛ�&@���ݏf@��5��@����8�@��ʺ�@��I����@ݽ��j8@ެ���p1@ߚc�C�#@�C�Ǵ��@๙sšB@�.�U��D@�m���@��Y݂�@⇃���#@��|&)�F@�i�Qi@�݋���@�T��׭U@�В��@�Q��@��A��n@�c��J�@��"���        @ՒQw �@Nۚ	��W@o�i�:�@���?I'@�3��@@�)2�W�f@���h���@�T�蟿�@�++k��%@��/zs�K@��V%��@��Xd>��@������@�v:���@�N�1،@�`x~�@�w��R[@ҶiE��@�(c�o�@���S�l@ސ�~�N�@���-��@�Iˡ;@�ė�Aδ@�@��l@�<�q�@�j���@��U��@�j%�e�@�4g���@��gт�2@�����A5n
��A��)�oA�1��g�A�����A	�Fq!#Adu�S�AҦZ8�A1�Q��A�����A���.�Asn�dA�[��nA���U�AS�k*�A��X��A�H�́A��q�-A h��r�3A!p}�2�A"�U��ʔA#���A��A$�[�t],A%��ݕ��A'2�6&?:A(y�7!ϻA)�	$��A+)g�w�A,�񾫿7A.��(�A/�7�#g A0�.4ٙY        @P�s��@<���G�@Xݤ����@kq�1l
@x>_+b	/@��(\���@�^D��@��+�ʅc@�<�u�R@���X�@�j��nbG@�{q�"R@���K,@�sD�}v@��w� �=@�&��6�@�&�4�A@�n�[�|z@�r���_@�w��1@�6雮��@��5��tA@��R�~n�@�����(@�pw��J�@�?���@�%FB�@�K>�500@��X�@�7�8>p�@�?WC��1@��(��օ@�Qx�bJA,�;�OA[:$��A�^
!UA0�[L-�A
���:DA�%���AA���51A�@r�(AS>��VA��B���A��pF3�A=��:A��]MlmA�t���Ap,��A:S��r3A ��EA!s���sA"dw2� �A#Zq춉A$Ug|\t
A%U�ss?A&\�t�QA'h�g��$A(}�"�IA)�6?�6A*���qeuA+�!V�	A-)3��A.p��Bd�        @��w�8�UAn��G�(A3�s,9AF�U.�oAT����[A_��-E��AfeJZ�aAn#nb���As��gD�Axӷ=���A~Ǿ� �A��gn!�A�y����aA��_#1�A�;V7�A�(�pE��A������A�<�oA�Xqe��A��5Z�"A�e�>c>VA�q�7��"A�����A�ؖ�ͯA�-Ӵ9vA���_�J�A�&��kA�Ъ��'uA� �����A�x�t��iA��k����A�>D��`�A��
a�vA�`C8e5A���l�A��{�$�zA�j�Eu�A�ڴ=M�`A�$^���A��i���/A���&M!A�Es3�=(A��(�WAô\,�e|A�nWC|XA�)��?w�A���q��Aƣ��ӏ�A�b>��6A�!�L˞A����(�Aɡ�E2'IA�a�A�A� ::|�A��b߿
ẠS �$�A�j���KA�9�HA�!z�a�A��1�k�A�k~6���A���՝�sA�c���        ?������?�c��.t�@�Q� ]@ 
P��H@,��QW@e@6L�旅@@ES"�@E��w�?"@Lt��@u�@Q��n� k@V0̥�Z@Z�����@_���!)@bxTY�8@eXҕ'R@hn���;�@k���+@oD���y@q�l��O�@s���A:6@u���{;@xp|ZP�@z�'fc@}r关�8@�9M���{@���P=��@��-
�S;@�~YEa^@�����i@���yƵ�@���LAjn@�m���y@�~�X#<@�ֳ��@@�=��!�@���у=@�:���p�@�з��j�@�v�ʞ��@�-S���I@���Y��@���Z�,@�\��K�@�[���$@�d���7@�v1�)�$@��!��`@��Q�b��@��^0��@�&�M`+@�oVG��c@���U!�5@�*�L�Q@@��i�n��@��+V�@�W�`Q�@�%�MQ0�@���%�?�@��֐�`�@���͑�@���D	�@���0(�3@�{��VJW        ?�B��
a'?��*Z�p?�)U�X3�@���_&@q6���@(����@5z\�(@B�����@MB6a��<@V�6��@an�V
;@i�K~s�@r�O�;	�@zi����[@�D�e�@�ɦ�+ )@���I6�@��)����@��։i7�@����U�Y@�@/})@��x�m@���O��@�v}���_@��`ni��@�T�n�O@�^�uF.B@�r"<P7@��hnwkw@���pg��@�*�]��@Ҭ.�Ϫ#@�|+ugˤ@آa#5�@�&��� @��J��2@�4�$�Vu@䛣��A@�@�D��c@�'�t
eO@�Q�8Hp@�al��x@�<a�a�@�;1����@�])��8E@����6�	@��,��j@��G���A �M�\Aa�1�oA�)"}M�Av��VqA
{�A���6z)A	_ *{OA ��A���J�A��]�׫A\܊�0AY�.3�A\�ȍ�Af7�7HAuǌ��U        ?��̲�O?Ʀ����?���']�@�2��;@�,yq@,�����@=��ɕ��@M>���U�@Z�إ�@d@g�V�2�@sj�}j�@~z��bL�@��J�a)@�~�m��}@�X�+B%@�B����@�����%�@��#���@�?��d[�@��th�@�{@��@���^�Sv@�HW�;�q@�wa�F�@�@�2��@�XRv�#@�i=�>3�@���B�~�@۬���zI@��5g��@�K"�n��@��S�"ܠ@�M���N@��v�@���=Q@���>�0�@�1�(~@���}u�@�an!2�@�jԍ4l�@���{L�@���ݑ��A ċѲ6AHs���uA�����A��*�AOK�ج`A	$�hii�A�o�[]AV��+A,y�Y�A�ɞ�A�0B+A�f��AY�ZtgAR�Hh0A���3�&A謤L�AC�o=4A��/3��A6A1��A���2�A�"(=�        @��)�>7|@�G����@Ҕv4�rF@�'�S��n@�!4��+@�1эz�iA�"���&A�U�A�Am�m5h�A�����AB	n�_�A"H�"�A%�8����A)��:5��A-�d��:A1���A3�6���A6+~�IsuA9�u�ٿA<3�N3T"A?��[�b&AA���Q��AC��:יAF/��F��AH�D�ɤAK�z��M#AO�2��AQe�dY�ASv(��AU��w�AX>v&��AZ�����A]���A`�vV�Ab3�]��Ac���*�Ae�m9��)Ag�zn/c>Ai����Al�'7�AnOC=��ApWK���Aq�ar��Ar�%�.�AtC@���nAu��A��Aw9w4Ax�r��H�Az}z��taA|>r�?\TA~�[כzA�D��A��6�B�A����� A�2S�lA�[bI��(A���ԫQ�A���j|�A�1��~�A�rncB��A��`i��bA�1��l��A����]!        ?�<U��h?�*V켤�@� � �@��ư@+W�kp��@4�B��/@=y1�r��@C�g�f�@I	g�~�@O��<�@R�7b���@V�S��G�@Z�,��*�@^�ºBV�@a�`��=[@d\�fP�@gT���@j��r�$@m �F�̭@p:�@q���o@s�N<��@u��C�F@x
�Hr�\@zP��j�@|�K��+x@J�%�)@�<�'.�@�s9��W�@��}���@���J:�r@�[@4��@�4!B&"@�,�]}@�H"@���(�V|@�����x@�H����@���z�@�&@�K�@��F>zC@�\�ZO-@���F�@�����خ@�Ӫ�	��@��O��a�@��l�Z@��b�i}@�3��N#~@�g�,��@������@� ��Tw�@�f����)@��7K�1�@�mZ,�/�@�m"	��@��9��E@�J��JOB@�<��74@�9����@�B\(�&@�V+J+@�u��u��        ?��<�<��?�� ֍oT?�)�&�{@�ί��@ѵW�e�@"t�.���@/Jx��@9`uf?��@D\A�;I4@O�8;R�@XlʱϨ@b+���z�@jO���Y�@r��[�`@y�=�Q�@�B�Uh�@�ؕ��@���"�^�@�1��@��	@I/@��u��@������@��,�u�L@�e�P*g&@�h�H�d@�|�̞�Z@��할t�@�ס1ev_@�+v��6@����cd�@ġqdÒ@Ǌ�BJ�}@ʼ����@�;��`�@�z�G��@��'a��@�Y�"?7@��w��f@�pc��{@�KM���@�/t��`�@����@�G��@僵$�E�@�C����@���y�@�gV��@�qx�(y�@��֪h�@��Fƺ�@�NO��@��3��AC@�e<'��@�����|@�����Ϗ@��X�<�@�+�-�@�x���A ��=�zVA����OA�Nr�}kA�`2TQAP�R        ?�2���?�z%���?�mŌ~�?�����@=,���@7�D�"�@(���ޱ�@5{�|Q�@A��b)@L��Xb@V]`��,@`�t�kD@h�u��@q�d_�C@w�Ix��@�+ó�;�@���X�@��z\�p�@�w����@���6bk@��L�%
C@�q��}�@���B%8@��Z�l/�@����{��@��g磈�@�h���<[@�zy�Y"�@��)�=T@3�2@�Q���@�a�ܸ٩@˾���'�@�m7����@ѹ��4_1@�뜗1L�@�N���9@�敥I@۵M�T�+@޾���@@��7%��@�������@䩒�E]@��iH&�@��kBoSK@�4n�'k@���ڂs�@�.Snl�@��*�$�@����@��IcH.@�l�9o��@�;r>�G<@�%+wc�@�+,�<B@�N?� 5A G�yߠ�Aws��	EA�y���\A�)Q*�Ab54*�A�م��eAJ�汓l        @|P)�8A7@�2iAG@�p�`��@��^,#�/@�
\"];@�&�o�HA HM[��fA�}:x�)As��{RA���At�X�AH�%��aAt1���A ~� A"�Z��^�A%�=�_�A(�@i�%�A+���/tA/1�v�_A1Nsm�Z)A3;zh��A5I��|A7{'�DL�A9�/~��A<J+ח�xA>�y`�{2A@�qo�NABR��y	�AC�Zx��AE�U,���AGH�B[AI"~mZ�aAK��V)AM,u��AOa����AP�ȩ)�AR0�g��ASr��HAT�m��CAVW�'aAW�M�&#�AY�Xr̯�A[=���NA]{%���A^��ϧs�A`fL!�YAag% /	�Abrb	c�!Ac��	��Ad�P;���Ae�_^���Agyt���Ah\[�h�Ai��'#iaAk&��Al�$-@�An���%Ao��K%c�Ap��q���Aq��n|B�Arc��ʬAsM�;�B�At@^/��w